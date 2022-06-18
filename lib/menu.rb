# frozen_string_literal: true

require 'io/console'

# The menu for the chess game
class Menu
  # SOURCE: https://gist.github.com/acook/4190379
  # Reads keypresses from the user including 2 and 3 escape character sequences.
  def self.read_char
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

  def self.clean_terminal_s
    # clear command prints this same string
    # '\e[' is the Control Sequence Introducer (CSI)
    # '2J' nJ clears the screen
    # n = 2 to clear the whole screen
    # n = 3 to clear the scrollback buffer as well
    # 'x;yH' puts the cursor at row x and column y
    # when skipped default values are 1;1 (start)
    "\e[H\e[2J\e[3J"
  end

  def self.clean_terminal
    print clean_terminal_s
  end

  def self.combine_strings(*args, padding: 0)
    strings = args.map(&:to_s)
    string_lines = strings.map { |string| string.split("\n") }
    line_count = string_lines.map(&:size)
    max_line_size = string_lines.map { |lines| lines.map(&:size).max }
    output = ''
    line_count.max.times do |line_i|
      strings.size.times do |string_i|
        if line_i < (string_lines[string_i].size)
          output += string_lines[string_i][line_i].ljust(max_line_size[string_i] + padding, ' ')
        end
      end
      output += "\n"
    end
    output
  end

  # ESC[ 38;2;⟨r⟩;⟨g⟩;⟨b⟩ m Select RGB foreground color
  # ESC[ 48;2;⟨r⟩;⟨g⟩;⟨b⟩ m Select RGB background color
  # ESC[ 0m to reset text
  # ESC[ is the Control Sequence Introducer
  def self.color_foreground(red, green, blue, text)
    "\e[38;2;#{red};#{green};#{blue}m#{text}\e[0m"
  end

  def self.color_background(red, green, blue, text)
    "\e[48;2;#{red};#{green};#{blue}m#{text}\e[0m"
  end

  def self.format_menu_list(options, selector_str, selection, selector_color = nil)
    formatted_selector_str = if selector_color.nil?
                               selector_str
                             else
                               red, green, blue = selector_color
                               color_foreground(red, green, blue, selector_str)
                             end
    options.values.map.with_index do |value, index|
      if index == selection
        "#{formatted_selector_str}\e[1m#{value}\e[0m"
      else
        "#{' ' * selector_str.size}#{value}"
      end
    end
  end
end
