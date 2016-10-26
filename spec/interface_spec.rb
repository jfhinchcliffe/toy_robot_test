require 'interface'
describe Interface do

  it "accepts valid commands" do
    expect(Interface.verify_command?("PLACE")).to be true
  end

  it "doesn't accept invalid commands" do
    expect(Interface.verify_command?("PATOOTY")).to be false
    expect(Interface.verify_command?("PLAACE")).to be false
  end

  it "correctly formats the place input string" do
    p = Interface.format_place_input(["1,1,DIRECTION"])
    expect(p[0]).to be_an_instance_of(Fixnum)
    expect(p[1]).to be_an_instance_of(Fixnum)
    expect(p[2]).to be_an_instance_of(String)
  end

  it "creates and places a robot in a valid position" do
    p = Interface.place(["1,1,NORTH"])
    expect(p.class).to be Robot
    expect(p.report).to eq "1,1,NORTH"
  end

  it "doesn't place a robot in an invalid position" do
    p = Interface.place(["10,2,NORTH"])
    expect(p).to be nil
    p = Interface.place(["-1,2,NORTH"])
    expect(p).to be nil
  end

end
