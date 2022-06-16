
require_relative '../lib/board'

describe Board do
  describe '#initialize' do
    subject(:empty_board) { described_class.new }
    context 'when there is no board template' do
      it 'should be empty' do
        expect(empty_board).to be_empty
      end
    end

    context 'when there is a template' do
      subject(:filled_board) { described_class.new board_template }
      context 'when the template is invalid' do
        context 'when the template contains invalid characters' do
          template = 'RNBQKBNR'\
            'PPPPXPPP'\
            '        '\
            '        '\
            '   y    '\
            '        '\
            'pppppppp'\
            'rnbqkbnr'
          let(:board_template) { template }
          it 'initializes an empty board' do
            expect(filled_board).to be_empty
          end
        end

        context 'when the template contains an invalid number of characters' do
          template = 'RNBQKBNR'\
            'PPPPPPPP'\
            '        '\
            '        '\
            '        '\
            '        '\
            'pppppppp'\
            'rnr'
          let(:board_template) { template }
          it 'is empty with invalid size' do
            expect(filled_board).to be_empty
          end
        end
      end
      context 'when the template is valid' do
        template = 'RNBQKBNR'\
          'PPPPPPPP'\
          '        '\
          '        '\
          '        '\
          '        '\
          'pppppppp'\
          'rnbqkbnr'
        let(:board_template) { template }
        xit 'initializes as the corresponding board' do
          # TODO: implement this beast
        end
      end
    end
  end
end
