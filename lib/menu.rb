# frozen_string_literal: true

require 'io/console'

# The menu for the chess game
class   Menu
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
    "\e[1J\e[0;0H"
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
end
