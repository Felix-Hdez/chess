# frozen_string_literal: true

require_relative '../menu'

# Has the main menu of our chess program
class MainMenu < Menu
  def initialize(board)
    super()
    @board = board
  end

  def main_menu
    Menu.clean_terminal
    selector_str = '♕ '
    formatted_selector_str = "\e[1;38;2;229;229;16m#{selector_str}\e[0m"
    selection = 0
    options = { new_game: 'New game', load_game: 'Load game', quit: 'Exit' }
    loop do
      option_list = options.values.map.with_index do |value, index|
        if index == selection
          "#{formatted_selector_str}\e[1m#{options.values[selection]}\e[0m"
        else
          "#{' ' * selector_str.size}#{value}"
        end
      end
      menu_text = (["  - C H E S S -\n"] + option_list).join "\n  "
      print Menu.clean_terminal_s + Menu.combine_strings(@board, menu_text, padding: 2)
      input = Menu.read_char
      case input
      when "\r"
        # RETURN
        return options.keys[selection]
      when "\e[A"
        # UP ARROW
        selection = (selection - 1) % options.size
      when "\e[B"
        # DOWN ARROW
        selection = (selection + 1) % options.size
      when "\u0003"
        # CONTROL C
        puts 'CONTROL-C'
        exit 0
      end
      # handle input
    end
  end

  def print_board
    Menu.clean_terminal
    print "-- C H E S S --\n#{board}"
  end
end
