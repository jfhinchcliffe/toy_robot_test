require_relative "./table.rb"
require_relative "./messages.rb"

class Robot

  VALID_DIRECTIONS = ["NORTH", "EAST", "SOUTH", "WEST"]

  attr_accessor :x, :y, :direction

  def initialize(args)
    @x = args[:x] || nil
    @y = args[:y] || nil
    @direction = args[:direction] || nil
    @table = args[:table]
    @placed = false
  end

  def place(commands)
    @placed = true
    @x = commands[:x]
    @y = commands[:y]
    @direction = commands[:direction]
  end

  def turn(turn)
    rotate_direction(get_new_direction_index(turn))
  end

  def report
    "#{@x},#{@y},#{@direction}"
  end

  def valid_directions
    VALID_DIRECTIONS
  end

  def move
    case @direction
    when "NORTH"
      @table.valid_position?({x: @x + 1, y: @y}) ? @x += 1 : Messages.invalid_move(@direction)
    when "SOUTH"
      @table.valid_position?({x: @x - 1, y: @y}) ? @x -= 1 : Messages.invalid_move(@direction)
    when "EAST"
      @table.valid_position?({x: @x, y: @y + 1}) ? @y += 1 : Messages.invalid_move(@direction)
    when "WEST"
      @table.valid_position?({x: @x, y: @y - 1}) ? @y -= 1 : Messages.invalid_move(@direction)
    end
  end

  def get_new_direction_index(turn)
    current_direction_index = VALID_DIRECTIONS.index(@direction)
    if turn == "LEFT"
      current_direction_index -= 1
    elsif turn == "RIGHT"
      current_direction_index += 1
    end
  end

  # Consider Modulo for this (use remainder)
  def rotate_direction(direction_index)
    if direction_index < 0
      @direction = VALID_DIRECTIONS.last
    elsif direction_index > (VALID_DIRECTIONS.length - 1)
      @direction = VALID_DIRECTIONS.first
    else
      @direction = VALID_DIRECTIONS[direction_index]
    end
  end

end
