require_relative "./robot.rb"
require_relative "./table.rb"
module Menu

  @robot = false
  VALID_COMMANDS = ["PLACE", "MOVE", "LEFT", "RIGHT", "REPORT"]

  def self.menu
    system "clear"
    exit = false
    while exit != true
      puts "Toy Robot Simulator 🤖 "
      puts "=" * 20
      puts "Move a toy robot around a 5x5 table"
      puts "valid coordinates range from 0,0 (south west corner) to 4,4 (north east corner)"
      if @robot
        Messages.robot_placed({x: @robot.x, y: @robot.y, direction: @robot.direction}) #{@robot.x}, #{@robot.y}, #{@robot.direction}"
      else
        puts "Robot has NOT been placed. Please use the place command"
      end
      puts "Valid commands are:"
      puts "PLACE X,Y,DIRECTION (North, East, South or West)"
      puts "MOVE"
      puts "LEFT"
      puts "RIGHT"
      puts "REPORT"
      puts "X to exit"
      puts "Commands are not case sensitive."
      print "Enter command > "
      command = gets.strip
      system "clear"
      case command
      when "x"
        exit = true
      else
        split_command(command)
      end
    end

  end

  def self.split_command(command)
    commands = command.upcase.split(' ')
    verify_command?(commands.first) ? execute_command(commands) : Messages.invalid_command(commands.first)
  end

  def self.verify_command?(command)
    VALID_COMMANDS.include?(command)
  end

  def self.execute_command(commands)
    command = commands.shift
    if @robot == false && command != "PLACE"
      Messages.robot_not_placed
    else
      case command
      when "PLACE"
        commands.length > 0 ? place(commands) : Messages.robot_not_placed
      when "MOVE"
        @robot.move
      when "LEFT", "RIGHT"
        @robot.turn(command)
      when "REPORT"
        puts @robot.report
      end
    end
  end

  def self.place(commands)
    x, y, direction = format_place_input(commands)
    create_table
    if Robot.valid_directions.include?(direction) && @table.valid_position?({x: x, y: y})
      @robot = Robot.new({x: x, y: y, direction: direction, table: @table})
    else
      Messages.invalid_command("#{x} #{y} #{direction}")
    end
  end

  def self.format_place_input(commands)
    commands = commands.last.split(',')
    formatted = []
    formatted << commands[0].to_i
    formatted << commands[1].to_i
    formatted << commands[2]
    formatted
  end

  def self.create_table
    @table = Table.new({x: 4, y: 4})
  end

end
