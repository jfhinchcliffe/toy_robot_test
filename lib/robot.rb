require_relative "./table.rb"
class Robot

  attr_reader :x, :y, :facing

  def initialize(x,y,facing)
    @x = x
    @y = y
    @facing = facing
  end

  def turn(direction)
    rotate(direction)
  end

  def report
    "#{@x},#{@y},#{@facing}"
  end


  private
    def rotate(direction)
      valid_facings = ["NORTH", "EAST", "SOUTH", "WEST"]
      current_facing_location = valid_facings.index(@facing)
      if direction == "LEFT"
        current_facing_location -= 1
      elsif direction == "RIGHT"
        current_facing_location += 1
      end
      if current_facing_location < 0
        @facing = valid_facings.last
      elsif current_facing_location > 3
        @facing = valid_facings.first
      else
        @facing = valid_facings[current_facing_location]
      end
    end
end
