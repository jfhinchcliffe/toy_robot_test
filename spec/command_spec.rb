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
    result = @command.format(command, @table, @robot)
    expect(result[:instruction]).to eq "THIS"
  end

  it "formats a place command into hash" do
    command = "PLACE 1,1,NORTH"
    returned_place_hash = {x: 1, y: 1, direction: "NORTH"}
    p = @command.format(command, @table, @robot)
    expect(p[:place]).to eq returned_place_hash
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
    commands = {instruction: "RIGHT", robot: @robot}
    3.times do
      @command.execute(commands)
    end
    expect(@robot.direction).to eq "WEST"
  end

  it "reports position and direction" do
    commands = {instruction: "REPORT", robot: @robot}
    p = @command.execute(commands)
    expect(p).to eq "1,4,WEST"
  end


end
