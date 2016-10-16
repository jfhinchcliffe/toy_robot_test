require_relative "./robot.rb"
require_relative "./table.rb"
module Menu

  @robot = false
  @valid_directions = ["NORTH","SOUTH","EAST","WEST"]

  def self.menu
    exit = false
    while exit != true
      puts "Toy Robot Simulator 🤖 "
      if @robot
        puts "Robot currently at #{@robot.x}, #{@robot.y}, #{@robot.facing}"
      else
        puts "Robot has NOT been placed. Please use the place command"
      end
      puts "Menu"
      puts "Valid commands are:"
      puts "PLACE X,Y,F"
      puts "MOVE"
      puts "LEFT"
      puts "RIGHT"
      puts "REPORT"
      puts "X to exit"
      command = gets.strip
      case command
      when "1"
        instructions
      when "x"
        exit = true
      else
        check_command(command)
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
  end

  def self.check_command(command)
    commands = command.upcase.split(' ')
    first_command = commands.shift
    if first_command == "PLACE" && commands.length == 1
      commands = commands.last.split(',')
      x = commands.shift.to_i
      y = commands.shift.to_i
      facing = commands.shift
      if Table.valid_position?(x, y) && @valid_directions.include?(facing)
        @robot = Robot.new(x,y,facing)
        puts "Robot has been placed"
      end
    end
    unless @robot == false
      if first_command == "MOVE"
        @robot.move
      elsif first_command == "LEFT" || first_command == "RIGHT"
        @robot.turn(first_command)
        puts "Robot has turned"
      elsif first_command == "REPORT"
        puts "Robot is currently at #{@robot.report}"
      end
    else
      puts "I don't understand the command."
    end
    gets
    system "clear"
  end

end

Menu.menu
