# frozen_string_literal: true

require_relative 'board'
require_relative 'piece'
require_relative 'menu'
require_relative 'menu/main_menu'

class Chess
  def initialize
    @board = Board.new
    @main_menu = MainMenu.new @board
  end

  def play
    @main_menu.main_menu
  end
end
