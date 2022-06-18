# frozen_string_literal: true

# Pawn piece
class Pawn < Piece
  def initialize(is_white)
    super
    @piece_text = { white: '♙', black: '♟' }
  end
end
