# frozen_string_literal: true

class Menu
  def initialize(board)
    @board = board
  end

  def print_board
    Menu.clean_terminal
    print "-- C H E S S --\n"
    print @board.to_s
  end

  def self.clean_terminal_s
    "\e[1J\e[0;0H"
  end

  def self.clean_terminal
    print clean_terminal_s
  end
end
