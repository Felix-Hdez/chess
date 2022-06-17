# frozen_string_literal: true

require_relative 'board'
require_relative 'piece'
require_relative 'menu'
require_relative 'menu/main_menu'

class Chess
  def initialize
    @board = Board.new_game
    @main_menu = MainMenu.new @board
  end

  def start
    choice = @main_menu.main_menu
    case choice
    when :new_game
      play
    when :load_game
      puts 'Hasnt been implemented yet'
      # load_game @main_menu.choose_save
    when :quit
      exit 0
    else
      raise 'choice is invalid'
      exit 0
    end
  end

  def play
    puts 'Starting new game'
    @board = Board.new_game
    
    puts 'this will be implemented later'
  end
end
