class Table

  attr_reader :x_max, :y_max

  def initialize(args = defaults)
    @x_max = args[:x]
    @y_max = args[:y]
    @x_min = 0
    @y_min = 0
  end

  def valid_position?(args)
    args[:x].between?(@x_min, @x_max) && args[:y].between?(@y_min, @y_max)
  end

  def defaults
    {x: 4, y: 4}
  end

end
