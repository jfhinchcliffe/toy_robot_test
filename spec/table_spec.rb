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
    result = @table.valid_position?({x: 2,y: 2})
    expect(result).to eq true
  end

  it "returns false when a potential move is invalid" do
    result = @table.valid_position?({x: 4,y: 2})
    expect(result).to eq false
  end


end
