require 'colorize'
module Messages

  def self.blank_input
    puts "Please enter a valid command".colorize(:red)
  end

  def self.invalid_move(direction)
    puts "Cannot move #{direction}".colorize(:red)
  end

  def self.robot_not_placed
    puts "Robot has not been placed. Please run a valid 'place' command".colorize(:red)
  end

  def self.robot_turned(direction)
    puts "Robot has turned #{direction}".colorize(:green)
  end

  def self.invalid_command(command)
    puts "#{command} isn't a valid command".colorize(:red)
  end

  def self.invalid_coordinates(coordinates)
    puts "Requested position - X: #{coordinates[:x]} Y: #{coordinates[:y]} Direction: #{coordinates[:direction]} isn't a valid coordinate".colorize(:red)
  end

  def self.current_coordinates(coordinates)
    puts "Current position - X: #{coordinates[:x]} Y: #{coordinates[:y]} Direction: #{coordinates[:direction]}".colorize(:green)
  end

end
