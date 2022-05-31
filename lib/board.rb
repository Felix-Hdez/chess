# frozen_string_literal: true

# Board state and to_s methods
class Board
  include Enumerable

  def initialize
    @board = Array.new(8) { Array.new(8) { nil } }
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
        output += square_stdout(row_number, column_number)
      end
      output += "\n"
    end
    output
  end

  private

  def square_stdout(row_number, column_number)
    # column_letters = 'abcdefgh'
    # square_text = "#{'♜ ♞ ♝ ♛ ♚ ♝ ♞ ♜ ♟ ♙ ♖ ♘ ♗ ♕ ♔ ♗ ♘ ♖'.split.sample} "
    # square_text = "#{column_letters[column_number]}#{8 - row_number}"
    piece = if @board[row_number][column_number].nil?
              '  '
            else
              "#{@board[row_number][column_number].piece_text} "
            end
    square_text = piece[...2]
    if (row_number + column_number).even?
      "\e[30;48;2;229;229;16m#{square_text}\e[0m"
    else
      "\e[30;48;2;255;255;255m#{square_text}\e[0m"
    end
  end
end
