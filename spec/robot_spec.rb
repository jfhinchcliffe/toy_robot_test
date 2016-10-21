require 'robot'
describe Robot do

  before(:all) do
    robot = {x: 0, y: 0, direction: "NORTH"}
    @robot = Robot.new(robot)
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
    robot = {x: 1, y: 3, direction: "EAST"}
    p = Robot.new(robot)
    expect(p.report).to eq("1,3,EAST")
    robot = {x: 3, y: 3, direction: "WEST"}
    q = Robot.new(robot)
    expect(q.report).to eq("3,3,WEST")
  end

  it "moves" do
    robot = {x: 1, y: 3, direction: "EAST"}
    y = Robot.new(robot)
    y.move
    expect(y.report).to eq("1,4,EAST")
  end

  it "can't move off the table" do
    robot = {x: 0, y: 0, direction: "SOUTH"}
    y = Robot.new(robot)
    y.move
    expect(y.report).to eq("0,0,SOUTH")
  end


end
