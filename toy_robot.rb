
require './square_board'

class ToyRobot
  SIZE = 5
  PLACE_REGEX = /^PLACE [0-5],[0-5],(NORTH|SOUTH|WEST|EAST)$/
  attr_accessor :square_board
  
  def run(file_path)
    file = File.open(file_path)
    file_data = file.readlines.map(&:chomp)

    file_data.each do |command|
      valid_command = check_command(command)
      execute_command(command, valid_command[:type]) if valid_command[:valid]
    end
  end

  def execute_command(command, command_type)
    return if @square_board.nil? && command_type != 'init'
    case command_type
    when 'init'
      init_position_arr = command.split(' ')[1].split(',')
      x = init_position_arr[0].to_i
      y = init_position_arr[1].to_i
      direction = init_position_arr[2]
      @square_board = SquareBoard.new(SIZE, x, y, direction)
    when 'move'
      @square_board.move
    when 'rotate'
      @square_board.rotate(command)
    when 'report'
      report = @square_board.report
      File.write('report/report.txt', report)
    else
      raise StandardError.new 'Invalid command'
    end
  end
  
  private

  def check_command(command)
    result = {valid: false}
    result = {valid: true, type: 'rotate'} if ['LEFT', 'RIGHT'].include?(command)
    result = {valid: true, type: 'move'}   if command == 'MOVE'
    result = {valid: true, type: 'report'} if command == 'REPORT'
    result = {valid: true, type: 'init'}   if PLACE_REGEX.match(command)

    result
  end
end