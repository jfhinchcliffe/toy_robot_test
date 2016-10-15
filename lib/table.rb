class Table

  TABLE_SIZE = {max_x: 5, max_y: 5}

  def self.valid_position(x,y)
    if x <= TABLE_SIZE[:max_x] && x >= 0 &&
    y <= TABLE_SIZE[:max_y] && y >= 0
      return true
    end
    false
  end

end
