class Table

  TABLE_SIZE = {max: 5, min: 0}

  def self.valid_position?(x,y)
    if x.between?(TABLE_SIZE[:min], TABLE_SIZE[:max]) && y.between?(TABLE_SIZE[:min], TABLE_SIZE[:max])
      return true
    end
    false
  end



end
