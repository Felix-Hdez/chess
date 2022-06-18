# frozen_string_literal: true

require_relative '../menu'

# Main menu of our chess program
class MainMenu
  def initialize(board)
    super()
    @board = board
  end

  def main_menu
    Menu.clean_terminal
    selector_str = '♕ '
    selector_color = [255, 255, 16] # [r, g, b]
    selection = 0
    options = { new_game: 'New game', load_game: 'Load game', quit: 'Exit' }
    loop do
      option_list = Menu.format_menu_list(options, selector_str, selection, selector_color)
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
end
