require 'table'
describe Table do

  it "returns true when coordinates are within TABLE_SIZE range" do
    result1 = Table.valid_position?(3, 3)
    result2 = Table.valid_position?(0, 0)
    result3 = Table.valid_position?(5, 5)
    expect(result1).to eq true
    expect(result2).to eq true
    expect(result3).to eq true
  end

  it "returns false when coordinates are outside TABLE_SIZE range" do
    result = Table.valid_position?(6, 2)
    expect(result).to eq false
  end

  it "moves the robot forward correctly based on faced direction" do
    p = Table.move(0,0,"NORTH")
    expect(p).to eq [1,0,"NORTH"]
    p = Table.move(3,3,"SOUTH")
    expect(p).to eq [2,3,"SOUTH"]
    p = Table.move(0,5,"WEST")
    expect(p).to eq [0,4,"WEST"]
  end

  it "does not allow the robot to move off the table" do
    p = Table.move(0,0,"SOUTH")
    expect(p).to eq [0,0,"SOUTH"]
    p = Table.move(5,3,"NORTH")
    expect(p).to eq [5,3,"NORTH"]
    p = Table.move(0,0,"WEST")
    expect(p).to eq [0,0,"WEST"]
  end

end
