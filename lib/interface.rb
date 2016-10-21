require_relative "./robot.rb"
require_relative "./table.rb"
module Menu

  @robot = false
  @valid_directions = ["NORTH","SOUTH","EAST","WEST"]

  def self.menu
    system "clear"
    exit = false
    while exit != true
      puts "Toy Robot Simulator 🤖 "
      puts "=" * 20
      puts "Move a toy robot around a 5x5 table"
      puts "valid coordinates range from 0,0 (south west corner) to 4,4 (north east corner)"
      if @robot
        puts "Robot currently at #{@robot.x}, #{@robot.y}, #{@robot.facing}"
      else
        puts "Robot has NOT been placed. Please use the place command"
      end
      puts "Valid commands are:"
      puts "PLACE X,Y,F"
      puts "MOVE"
      puts "LEFT"
      puts "RIGHT"
      puts "REPORT"
      puts "X to exit"
      puts "Commands are not case sensitive."
      print "Enter command > "
      command = gets.strip
      case command
      when "x"
        exit = true
      else
        check_command(command)
      end
    end

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
        puts "Robot has turned #{first_command}"
      elsif first_command == "REPORT"
        puts "Robot is currently at #{@robot.report}"
      end
    else
      puts "I don't understand the command - please use a valid one"
    end
    gets
    system "clear"
  end

end
