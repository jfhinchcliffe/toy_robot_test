require_relative "./command.rb"

class Interface

  attr_reader :command

  def initialize
    @command = Command.new
  end

  def menu
    system "clear"
    exit = false
    while exit != true
      puts "Toy Robot Simulator 🤖 "
      puts "=" * 20
      puts "Move a toy robot around a 5x5 table"
      puts "valid coordinates range from 0,0 (south west corner) to 4,4 (north east corner)"
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
        @command.verify?(command) ? @command.execute : Messages.invalid_command(command)
      end
    end
  end

end
