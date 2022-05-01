# frozen_string_literal: true

require_relative 'board'
require_relative 'menu'

class Game
  def initialize
    @board = Board.new
    @menu = Menu.new @board
  end

  def play
    @menu.print_board
  end
end
