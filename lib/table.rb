class Table

  def initialize(args = defaults)
    @x_max = args[:x]
    @y_max = args[:y]
    @x_min = 0
    @y_min = 0
  end

  def valid_position?(args)
    args[:x].between?(@x_min, @x_max) && args[:y].between?(@y_min, @y_max) ? true : false
  end

  def valid_move?(args)
    case args[:direction]
    when "NORTH"
      valid_position?({x: args[:x] + 1, y: args[:y]})
    when "SOUTH"
      valid_position?({x: args[:x] - 1, y: args[:y]})
    when "EAST"
      valid_position?({x: args[:x], y: args[:y] + 1})
    when "WEST"
      valid_position?({x: args[:x], y: args[:y] - 1})
    end
  end

  private

    def defaults
      {x: 4, y: 4}
    end

end
