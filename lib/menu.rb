# frozen_string_literal: true

require 'io/console'

# The menu for the chess game
class Menu
  def initialize(board)
    @board = board
  end

  def main_menu
    Menu.clean_terminal
    loop do
      p read_char
    end
  end

  # SOURCE: https://gist.github.com/acook/4190379
  # Reads keypresses from the user including 2 and 3 escape character sequences.
  def read_char
    $stdin.echo = false
    $stdin.raw!

    input = $stdin.getc.chr
    if input == "\e"
      begin
        input << $stdin.read_nonblock(3)
      rescue EAGAINWaitReadable
        nil
      end
      begin
        input << $stdin.read_nonblock(2)
      rescue EAGAINWaitReadable
        nil
      end
    end
  ensure
    $stdin.echo = true
    $stdin.cooked!
    exit 0 if input == "\u0003"

    return input
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
