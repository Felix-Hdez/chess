# frozen_string_literal: true

require_relative 'piece'
require_relative 'menu'

# An array with extra methods
# Supports having nil and Piece descendants as elements of the array.
class Board
  include Enumerable

  def initialize(board_template = nil)
    @board = if valid_template? board_template
               get_unserialized_board board_template
             else
               Array.new(8) { Array.new(8) { nil } }
             end
  end

  def self.new_game
    template = 'RNBQKBNR'\
      'PPPPPPPP'\
      '        '\
      '        '\
      '        '\
      '        '\
      'pppppppp'\
      'rnbqkbnr'
    Board.new template
  end

  def [](index)
    @board[index]
  end

  def []=(index, val)
    @board[index] = val
  end

  def each(&block)
    @board.each(&block)
  end

  def empty?
    @board.flatten.all? nil
  end

  def to_s
    output = ''
    7.downto(0) do |row_number|
      0.upto(7) do |column_number|
        text = square_text(row_number, column_number)
        output += colorize_square(text, row_number, column_number)
      end
      output += "\n"
    end
    output
  end

  def get_unserialized_board(board_template)
    board = Array.new(8) { Array.new(8) }
    board_template.split('').each.with_index do |piece, index|
      row = index / 8
      column = index % 8
      board[row][column] = Piece.get_piece piece
    end
    board
  end

  def valid_template?(board_template)
    return false if board_template.nil?

    is_correct_size = board_template.size == 64
    are_characters_valid = board_template.split('').all? do |char|
      ['r', 'n', 'b', 'q', 'k', 'p', ' '].include? char.downcase
    end
    is_correct_size && are_characters_valid
  end

  private

  def colorize_square(square_text, row_number, column_number)
    square_text = Menu.color_foreground(0, 0, 0, square_text)
    if (row_number + column_number).even?
      Menu.color_background(229, 229, 16, square_text)
    else
      Menu.color_background(255, 255, 255, square_text)
    end
  end

  def square_text(row_number, column_number)
    # column_letters = 'abcdefgh'
    # square_text = "#{'♜ ♞ ♝ ♛ ♚ ♝ ♞ ♜ ♟ ♙ ♖ ♘ ♗ ♕ ♔ ♗ ♘ ♖'.split.sample} "
    # square_text = "#{column_letters[column_number]}#{8 - row_number}"
    piece = @board[row_number][column_number]
    piece_text = (piece.nil? ? '' : piece.piece_text)
    "#{piece_text}  "[...2]
  end
end
