# frozen_string_literal: true

# Rook piece
class Rook < Piece
  def initialize(is_white)
    super
    @piece_text = { white: '♖', black: '♜' }
  end
end
