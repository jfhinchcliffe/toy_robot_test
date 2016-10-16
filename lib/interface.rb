require_relative "./robot.rb"
module Menu

  @placed = false

  def self.menu
    exit = false
    while exit != true
      puts "Toy Robot Simulator 🤖 "
      puts "Menu"
      puts "Enter command or press 1 to see a list of valid commands"
      puts "Enter x to exit"
      command = gets.strip
      case command
      when "1"
        instructions
      when "x"
        exit = true
      else
        parse_command(command)
      end
    end

  end

  def self.instructions
    puts "First, place the robot at and coordinate on the 5x5 table by using:"
    puts "PLACE X,Y,DIRECTION"
    puts "where X and Y are coordinates, and DIRECTION is NORTH, EAST, SOUTH or WEST"
    puts "once a robot has been placed, you can move it by entering MOVE"
    puts "MOVE will move the robot one step in the direction it is facing (if there is room)"
    puts "REPORT will return the robots current location and direction"
    puts "Press enter to return to the menu"
    gets
    system "clear"
  end

  def self.parse_command(command)

  end

end

Menu.menu
