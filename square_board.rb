class SquareBoard
  ROTATE_DIRECTS = {
    'NORTH' => {
      'LEFT' => 'WEST',
      'RIGHT' => 'EAST'
    },
    'SOUTH'=> {
      'LEFT'=> 'EAST',
      'RIGHT'=> 'WEST'
    },
    'WEST'=> {
      'LEFT'=> 'SOUTH',
      'RIGHT'=> 'NORTH'
    },
    'EAST'=> {
      'LEFT'=> 'NORTH',
      'RIGHT'=> 'SOUTH'
    }
  }

  ROTATE_TYPES = ['LEFT', 'RIGHT']

  attr_accessor :x, :y, :direction

  def initialize(size, x, y, direction)
    @size = size
    @x = x
    @y = y
    @direction = direction
  end

  def self.validate_rotate?(type)
    ROTATE_TYPES.include?(type)
  end

  def self.validate_direction?(direction)
    ROTATE_DIRECTS.keys.include?(direction)
  end

  def self.validate_position?(size, x, y)
    min = 0
    max = size - 1
    (min..max).include?(x) && (min..max).include?(y)
  end

  def max_position
    @size - 1
  end

  def move
    case @direction
    when 'NORTH'
      new_position = @y + 1
      @y = new_position if new_position <= max_position
    when 'SOUTH'
      new_position = @y - 1
      @y = new_position if new_position >= 0
    when 'WEST'
      new_position = @x - 1
      @x = new_position if new_position >= 0
    when 'EAST'
      new_position = @x + 1
      @x = new_position if new_position <= max_position
    else
      raise StandardError.new "Invalid direction"
    end
  end
  
  def rotate(type)
    @direction = ROTATE_DIRECTS[@direction][type]
  end
  
  def report
    "#{@x}, #{@y}, #{@direction}"
  end
end