require 'command'
require 'table'
require 'robot'
  describe Command do

  before(:all) do
    @command = Command.new
    @table = Table.new
    @robot = Robot.new({table: @table})
  end

  it "formats a single command into hash" do
    command = "THIS"
    output = {instruction: "THIS"}
    expect(@command.format(command)).to eq output
  end

  it "formats a place command into hash" do
    command = "PLACE 1,1,NORTH"
    returned_instruction = "PLACE"
    returned_place_array = [1,1,"NORTH"]
    p = @command.format(command)
    expect(p[:instruction]).to eq returned_instruction
    expect(p[:place]).to eq returned_place_array
  end

  it "verifies valid commands" do
    valid_command = {instruction: "PLACE", place: [1,2,"SOUTH"]}
    expect(@command.verify?(valid_command)).to be true
    valid_command = {instruction: "LEFT"}
    expect(@command.verify?(valid_command)).to be true
  end

  it "rejects invalid commands" do
    invalid_command = {instruction: "PLOp", place: [1,2,"SOUTH"]}
    expect(@command.verify?(invalid_command)).to be false
  end

  it "formats place information to array" do
    formatted_value = @command.format_place("PLACE 1,2,NORTH")
    expect(formatted_value).to eq [1,2,"NORTH"]
  end

  it "executes the place command" do
    commands = {instruction: "PLACE", table: @table, robot: @robot, x: 1, y: 3, direction: "EAST" }
    @command.execute(commands)
    expect(@robot.x).to eq 1
    expect(@robot.y).to eq 3
  end

  it "executes the move command" do
    commands = {instruction: "MOVE", table: @table, robot: @robot, x: 1, y: 3, direction: "EAST" }
    @command.execute(commands)
    expect(@robot.x).to eq 1
    expect(@robot.y).to eq 4
  end

  it "turns" do
    commands = {instruction: "LEFT", robot: @robot}
    @command.execute(commands)
    expect(@robot.direction).to eq "NORTH"
    puts @robot.direction
    commands = {instruction: "RIGHT", robot: @robot}
    puts @robot.direction
    commands = {instruction: "RIGHT", robot: @robot}
    puts @robot.direction
    @robot.turn("LEFT")
    commands = {instruction: "LEFT", robot: @robot}
    puts @robot.direction
    expect(@robot.direction).to eq "WEST"
  end


end
