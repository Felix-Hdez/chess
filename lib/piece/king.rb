# frozen_string_literal: true

# King piece
class King < Piece
  def initialize(is_white)
    super
    @piece_text = { white: '♔', black: '♚' }
  end
end
