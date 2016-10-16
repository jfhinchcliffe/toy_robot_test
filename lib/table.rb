class Table

  TABLE_SIZE = {max: 5, min: 0}

  def self.valid_position?(x,y)
    if x.between?(TABLE_SIZE[:min], TABLE_SIZE[:max]) && y.between?(TABLE_SIZE[:min], TABLE_SIZE[:max])
      return true
    end
    false
  end

  def self.move(x,y,facing)
    x_updated = x
    y_updated = y
    case facing
    when "NORTH"
      x_updated = x + 1 if valid_position?(x + 1, y)
    when "SOUTH"
      x_updated = x - 1 if valid_position?(x - 1, y)
    when "EAST"
      y_updated = y + 1 if valid_position?(x, y + 1)
    when "WEST"
      y_updated = y - 1 if valid_position?(x, y - 1)
    end
    return [x_updated, y_updated, facing]
  end



end
