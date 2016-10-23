require 'menu'
describe Menu do

  it "only accepts valid commands" do
    expect(Menu.verify_command?("PLACE")).to be true
  end

end
