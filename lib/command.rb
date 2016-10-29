require_relative "./table.rb"
require_relative "./robot.rb"

class Command

  VALID_COMMANDS = ["PLACE", "MOVE", "LEFT", "RIGHT", "REPORT"]
  attr_reader :instruction

  def initialize
    @instruction = {}
    @table = Table.new
    @robot = Robot.new(@table)
  end

  def verify?(command)
    reset_instruction
    command = format(command)
    return false unless VALID_COMMANDS.include?(command[0])
    return false if command[0] == "PLACE" && check_place?(command[1]) == false
    if command[0] != "PLACE" && @robot.placed == false
      Messages.robot_not_placed
      return false
    end
    set_instruction(command)
    true
  end

  def execute
    case @instruction[:command]
    when "PLACE"
      @table.valid_position?(@instruction[:place]) ? @robot.place(@instruction[:place]) : Messages.invalid_coordinates(@instruction[:place])
    when "MOVE"
      @robot.move
    when "LEFT", "RIGHT"
      @robot.turn(@instruction[:command])
    when "REPORT"
      @robot.report
    end
  end

  #tested
  def format(command)
    command = command.upcase.split(' ')
  end

  #tested
  def format_place(place_command)
    place = {}
    formatted_command = place_command.split(',')
    place[:x] = formatted_command[0].to_i
    place[:y] = formatted_command[1].to_i
    place[:direction] = formatted_command[2]
    place
  end

  #tested
  def check_place?(place)
    if place == nil
      return false
    else
      place = format_place(place)
      unless @robot.valid_directions.include?(place[:direction]) && place.length == 3
        return false
      end
    end
    true
  end

  def reset_instruction
    @instruction = {}
  end

  #tested
  def set_instruction(validated_command)
    @instruction[:command] = validated_command[0]
    @instruction[:place] = format_place(validated_command[1]) if @instruction[:command] == "PLACE"
  end

end
