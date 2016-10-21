module Messages

  def self.invalid_move(direction)
    puts "Cannot move #{direction}"
  end

  def self.robot_placed(coordinates)
    puts "Robot has been placed."
    puts "Current position: X #{coordinates[:x]} Y #{coordinates[:y]} Direction #{coordinates[:direction]}"
  end

  def self.robot_turned(direction)
    puts "Robot has turned #{direction}"
  end

  def self.invalid_command(command)
    "#{command} isn't a valid command"
  end

end
