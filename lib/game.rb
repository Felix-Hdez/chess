# frozen_string_literal: true

require_relative 'board'

# stores a chess game
class Game
  def initialize(init_board = Board.new_game)
    @game_states = [init_board]
  end

  # TODO: implement later
  def self.load_game(name); end

  # TODO: implement later
  def game_over?; end
end
