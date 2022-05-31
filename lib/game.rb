# frozen_string_literal: true

require_relative 'board'
require_relative 'menu'

class Game
  def initialize
    @board = Board.new
    @menu = Menu.new @board
  end

  def play
    @menu.main_menu
  end
end
