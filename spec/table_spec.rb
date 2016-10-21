require 'table'
describe Table do

  before(:all) do
    @table = Table.new({x: 3, y: 3})
  end

  it "valid position returns true when coordinates are within the table range" do
    result1 = @table.valid_position?({x: 3, y: 3})
    expect(result1).to eq true
  end

  it "valid position returns false when coordinates are outside the table range" do
    result = @table.valid_position?({x: 6, y: 3})
    expect(result).to eq false
  end

  it "returns true when a potential move is valid" do
    result = @table.valid_move?({x: 2,y: 2,direction: "SOUTH"})
    expect(result).to eq true
  end

  it "returns false when a potential move is invalid" do
    result = @table.valid_move?({x: 3,y: 2,direction: "NORTH"})
    expect(result).to eq false
  end


  #
  # it "moves the robot forward correctly based on faced direction" do
  #   p = Table.move(0,0,"NORTH")
  #   expect(p).to eq [1,0,"NORTH"]
  #   p = Table.move(3,3,"SOUTH")
  #   expect(p).to eq [2,3,"SOUTH"]
  #   p = Table.move(0,5,"WEST")
  #   expect(p).to eq [0,4,"WEST"]
  # end
  #
  # it "does not allow the robot to move off the table" do
  #   p = Table.move(0,0,"SOUTH")
  #   expect(p).to eq [0,0,"SOUTH"]
  #   p = Table.move(5,3,"NORTH")
  #   expect(p).to eq [5,3,"NORTH"]
  #   p = Table.move(0,0,"WEST")
  #   expect(p).to eq [0,0,"WEST"]
  # end

end
