# frozen_string_literal: true

# To avoid circular dependency errors, sub-optimal
class Piece; end

Dir["#{File.dirname(__FILE__)}/piece/*"].each do |file|
  require file
end

# Average piece
class Piece
  def initialize(is_white)
    @color = (is_white ? :white : :black)
  end

  def self.get_piece(str_representation)
    raise 'Piece#getPiece needs a string' if str_representation.class != String

    return nil if str_representation == ' '

    is_white_piece = str_representation != str_representation.downcase
    pieces = { 'p' => Pawn, 'r' => Rook, 'n' => Knight, 'b' => Bishop, 'q' => Queen, 'k' => King }
    pieces[str_representation.downcase].new(is_white_piece)
  end

  def piece_text
    @piece_text[@color]
  end
end
