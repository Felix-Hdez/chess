# frozen_string_literal: true

require_relative '../menu'

# Has the main menu of our chess program
class MainMenu < Menu
  def initialize(board)
    @board = board
  end

  def main_menu
    Menu.clean_terminal
    welcome_msg = '- C H E S S -'
    puts Menu.combine_strings(@board, welcome_msg, padding: 5)
  end

  def print_board
    Menu.clean_terminal
    print "-- C H E S S --\n#{board}"
  end

end
