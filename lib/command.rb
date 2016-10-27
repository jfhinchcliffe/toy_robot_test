require_relative "./table.rb"
require_relative "./robot.rb"

class Command

  attr_accessor :instruction, :robot

  def initialize
    @instruction = {}
    @table = Table.new
    @robot = Robot.new({table: @table})
  end

  VALID_COMMANDS = ["PLACE", "MOVE", "LEFT", "RIGHT", "REPORT"]

  def verify?(command)
    format(command)
  end

  def format(command_string)
    split_command = command_string.split(' ')
    @instruction[:command] = split_command.shift.upcase
    return false unless VALID_COMMANDS.include?(@instruction[:command])
    puts "SCL"
    puts split_command.length
    gets
    if @instruction[:command] == "PLACE"
      @instruction[:place] = format_place(split_command) if split_command.length == 1
      return false if split_command.length == 0
    else
      @instruction[:place] = nil
    end
    true
  end

  def execute
    case @instruction[:command]
    when "PLACE"
      @table.valid_position?(@instruction[:place]) ? @robot.place(@instruction[:place]) : Messages.invalid_command("#{commands[:x]} #{commands[:y]} #{commands[:direction]}")
    when "MOVE"
      @robot.move
    when "LEFT", "RIGHT"
      @robot.turn(@instruction[:command])
    when "REPORT"
      @robot.report
    end
    puts "ROBOT"
    puts @robot.x
    puts @robot.y
    puts @robot.direction
    gets
  end

  def format_place(command)
    formatted_place = {}
    command = command.last.split(',')
    if command.length == 3 && @robot.valid_directions.include?(command.last.upcase)
      formatted_place[:x], formatted_place[:y], formatted_place[:direction] = command[0].to_i, command[1].to_i, command[2].upcase
    else
      formatted_place = nil
    end
    formatted_place
  end

end
