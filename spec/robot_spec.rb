require 'robot'
describe Robot do

  before(:all) do
    @table = Table.new
    @robot = Robot.new(@table)
    @robot.x = 0
    @robot.y = 3
    @robot.direction = "NORTH"
  end

  it "can initialise a robot" do
    expect(@robot.x).to eq 0
    expect(@robot.y).to eq 3
    expect(@robot.direction).to eq "NORTH"
  end

  it "can turn left and right" do
    @robot.turn("LEFT")
    expect(@robot.direction).to eq "WEST"
    @robot.turn("RIGHT")
    expect(@robot.direction).to eq "NORTH"
    @robot.turn("RIGHT")
    expect(@robot.direction).to eq "EAST"
  end

  it "reports correctly with position and coords" do
    expect { @robot.report }.to output("\e[0;32;49mCurrent position - X: 0 Y: 3 Direction: EAST\e[0m\n").to_stdout
  end

  it "moves" do
    @robot.move
    expect(@robot.y).to eq(4)
  end

  it "can't move off the table" do
    @robot.move
    expect(@robot.y).to eq(4)
  end


end
