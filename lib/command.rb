
class Command

  VALID_COMMANDS = ["PLACE", "MOVE", "LEFT", "RIGHT", "REPORT"]

  def format(command_string, table, robot)
    split_command = command_string.split(' ')
    command = {}
    command[:instruction] = split_command[0].upcase
    command[:place] = format_place(split_command[1]) if split_command.length > 1
    command[:table], command[:robot] = table, robot
    command
  end

  def verify?(commands)
    VALID_COMMANDS.include?(commands[:instruction])
  end

  def execute(commands)
    case commands[:instruction]
    when "PLACE"
      commands[:table].valid_position?(commands) ? commands[:robot].place(commands) : Messages.invalid_command("#{commands[:x]} #{commands[:y]} #{commands[:direction]}")
    when "MOVE"
      commands[:robot].move
    when "LEFT", "RIGHT"
      commands[:robot].turn(commands[:instruction])
    when "REPORT"
      commands[:robot].report
    end
  end

  def format_place(command)
    formatted_place = {}
    command = command.split(' ').last.split(',')
    formatted_place[:x], formatted_place[:y], formatted_place[:direction] = command[0].to_i, command[1].to_i, command[2]
    formatted_place
  end

end
