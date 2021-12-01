require_relative '../toy_robot'
describe ToyRobot do
  let(:toy_robot) { ToyRobot.new }
  
  it 'return new postion' do
    toy_robot.run('spec/assets/normal.txt')
    expect(toy_robot.square_board.report).to eq('3, 3, NORTH')
  end

  it 'invalid place command' do
    toy_robot.run('spec/assets/invalid_place.txt')
    expect(toy_robot.square_board).to eq(nil)
  end

  it 'discard command until valid place command exist' do
    toy_robot.run('spec/assets/discard.txt')
    expect(toy_robot.square_board).not_to be(nil)
    expect(toy_robot.square_board.report).to eq('1, 2, NORTH')
  end

  context 'rotate' do
    it 'rotate left' do
      toy_robot.run('spec/assets/left.txt')
      expect(toy_robot.square_board.direction).to eq('EAST')
    end

    it 'rotate right' do
      toy_robot.run('spec/assets/right.txt')
      expect(toy_robot.square_board.direction).to eq('NORTH')
    end
  end

  context 'outside board' do
    it 'return max position' do
      toy_robot.run('spec/assets/outside.txt')
      expect(toy_robot.square_board.report).to eq('3, 4, NORTH')
    end
  end
  
end