# frozen_string_literal: true

# Knight piece
class Knight < Piece
  def initialize(is_white)
    super
    @piece_text = { white: '♘', black: '♞' }
  end
end
