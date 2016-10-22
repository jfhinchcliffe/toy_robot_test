require 'robot'
describe Robot do

  before(:all) do
    robot = {x: 0, y: 0, direction: "NORTH", table: @table}
    @robot = Robot.new(robot)
    @table = Table.new
  end

  it "can initialise a robot" do
    expect(@robot.x).to eq 0
    expect(@robot.y).to eq 0
    expect(@robot.direction).to eq "NORTH"
  end

  it "can turn left and right" do
    @robot.turn("LEFT")
    expect(@robot.direction).to eq "WEST"
  end

  it "reports correctly with position and coords" do
    robot = {x: 1, y: 3, direction: "EAST", table: @table}
    p = Robot.new(robot)
    expect(p.report).to eq("1,3,EAST")
  end

  it "moves" do
    robot = {x: 1, y: 3, direction: "EAST", table: @table}
    y = Robot.new(robot)
    y.move
    expect(y.report).to eq("1,4,EAST")
  end

  it "can't move off the table" do
    robot = {x: 0, y: 0, direction: "SOUTH", table: @table}
    y = Robot.new(robot)
    y.move
    expect(y.report).to eq("0,0,SOUTH")
  end


end
