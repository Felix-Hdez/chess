# frozen_string_literal: true

class Pawn < Piece
  def initialize(is_white)
    super
    @piece_text = { white: '♙', black: '♟' }
  end

end
