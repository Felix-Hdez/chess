# frozen_string_literal: true

require_relative 'board'
require_relative 'piece'
require_relative 'menu'
require_relative 'main_menu'

# App controller
class Chess
  def initialize
    @main_menu = MainMenu.new Board.new_game
  end

  def start
    choice = @main_menu.main_menu
    case choice
    when :new_game
      play
    when :load_game
      name = @main_menu.load_game
      play(name) unless name.nil?
    when :quit
      exit 0
    else
      raise 'choice is invalid'
    end
  end

  def play(name = nil)
    game = (game.nil? ? Game.new : Game.load_game(name))
    game_menu = GameMenu.new game
    loop do
      move = game_menu.make_move
      case move
      when :move
        break if game.game_over?
      when :quit
        main_menu.save_game
        break
      end
    end
  end
end
