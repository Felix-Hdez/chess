# frozen_string_literal: true

# Bishop piece
class Bishop < Piece
  def initialize(is_white)
    super
    @piece_text = { white: '♗', black: '♝' }
  end
end
