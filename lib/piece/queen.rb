# frozen_string_literal: true

# Queen piece
class Queen < Piece
  def initialize(is_white)
    super
    @piece_text = { white: '♕', black: '♛' }
  end
end
