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

end
