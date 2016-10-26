class Command

  VALID_COMMANDS = ["PLACE", "MOVE", "LEFT", "RIGHT", "REPORT"]

  def format(command_string)
    split_command = command_string.split(' ')
    command = {}
    command[:instruction] = split_command[0]
    command[:place] = format_place(split_command[1]) if split_command.length > 1
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
      puts commands[:instruction]
      commands[:robot].turn(commands[:instruction])

    # when "REPORT"

    end
  end

  def format_place(command)
    command = command.split(' ').last.split(',')
    command[0], command[1], command[2] = command[0].to_i, command[1].to_i, command[2]
  end

end
