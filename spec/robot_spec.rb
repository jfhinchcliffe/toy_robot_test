require 'robot'
describe Robot do

  before(:all) do
    @robot = Robot.new(0,0,"NORTH")
  end

  it "can initialise a robot" do
    expect(@robot.x).to eq 0
    expect(@robot.y).to eq 0
    expect(@robot.facing).to eq "NORTH"
  end

  it "can turn left and right" do
    @robot.turn("LEFT")
    expect(@robot.facing).to eq "WEST"
    @robot.turn("LEFT")
    expect(@robot.facing).to eq "SOUTH"
    @robot.turn("LEFT")
    expect(@robot.facing).to eq "EAST"
    @robot.turn("LEFT")
    expect(@robot.facing).to eq "NORTH"
    @robot.turn("RIGHT")
    expect(@robot.facing).to eq "EAST"
    @robot.turn("RIGHT")
    expect(@robot.facing).to eq "SOUTH"
    @robot.turn("RIGHT")
    expect(@robot.facing).to eq "WEST"
    @robot.turn("RIGHT")
    expect(@robot.facing).to eq "NORTH"
  end

  it "reports correctly with position and coords" do
    p = Robot.new(1,3,"EAST")
    expect(p.report).to eq("1,3,EAST")
    q = Robot.new(5,5,"WEST")
    expect(q.report).to eq("5,5,WEST")
  end

end
