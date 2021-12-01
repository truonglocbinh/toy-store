require_relative '../square_board'
describe SquareBoard do
  describe '#move' do
    context 'valid position' do
      it 'increase y position' do
        square_board = SquareBoard.new(5, 0, 0, 'NORTH')
        square_board.move
        expect(square_board.y).to eq(1)
      end
  
      it 'decrease y position' do
        square_board = SquareBoard.new(5, 2, 2, 'SOUTH')
        square_board.move
        expect(square_board.y).to eq(1)
      end

      it 'increase x position' do
        square_board = SquareBoard.new(5, 1, 0, 'WEST')
        square_board.move
        expect(square_board.x).to eq(0)
      end
  
      it 'decrease x position' do
        square_board = SquareBoard.new(5, 1, 2, 'EAST')
        square_board.move
        expect(square_board.y).to eq(2)
      end
    end

    context 'invalid position' do
      it 'keep y position when out top of board' do
        square_board = SquareBoard.new(5, 4, 4, 'NORTH')
        square_board.move
        expect(square_board.y).to eq(4)
      end
  
      it 'keep y position when out bottom of board' do
        square_board = SquareBoard.new(5, 0, 0, 'SOUTH')
        square_board.move
        expect(square_board.y).to eq(0)
      end

      it 'keep x position when out left of board' do
        square_board = SquareBoard.new(5, 0, 0, 'WEST')
        square_board.move
        expect(square_board.x).to eq(0)
      end
  
      it 'keep x position when out right of board' do
        square_board = SquareBoard.new(5, 4, 4, 'EAST')
        square_board.move
        expect(square_board.x).to eq(4)
      end
    end
  end

  describe '#rotate' do
    before do
      @north_board = SquareBoard.new(5, 2, 2, 'NORTH')
      @south_board = SquareBoard.new(5, 1, 3, 'SOUTH')
      @west_board = SquareBoard.new(5, 3, 1, 'WEST')
      @east_board = SquareBoard.new(5, 2, 1, 'EAST')
    end
    context 'left' do
      it 'return valid rotate' do
        @north_board.rotate('LEFT')
        @south_board.rotate('LEFT')
        @west_board.rotate('LEFT')
        @east_board.rotate('LEFT')
        expect(@north_board.direction).to eq('WEST')
        expect(@south_board.direction).to eq('EAST')
        expect(@west_board.direction).to eq('SOUTH')
        expect(@east_board.direction).to eq('NORTH')
      end
    end

    context 'right' do
      it 'return valid rotate' do
        @north_board.rotate('RIGHT')
        @south_board.rotate('RIGHT')
        @west_board.rotate('RIGHT')
        @east_board.rotate('RIGHT')
        expect(@north_board.direction).to eq('EAST')
        expect(@south_board.direction).to eq('WEST')
        expect(@west_board.direction).to eq('NORTH')
        expect(@east_board.direction).to eq('SOUTH')
      end
    end
  end

  describe '#report' do
    it 'return valid string' do
      square_board = SquareBoard.new(5, 2, 2, 'NORTH')
      expect(square_board.report).to eq('2, 2, NORTH')
    end
  end
end