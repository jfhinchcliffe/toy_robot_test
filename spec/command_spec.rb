require 'command'
require 'table'
require 'robot'
  describe Command do

  before(:all) do
    @command = Command.new
  end

  context 'only allows valid input' do

    it "reject all commands except a valid place when robot isn't placed" do
      expect(@command.verify?("PLACE")).to be false
      expect(@command.check_place?("LEFT")).to be false
      expect(@command.check_place?("PLACE 1,1,WEST")).to be true
    end

    it "rejects invalid commands" do
      expect(@command.verify?("SNIPPY")).to be false
      expect(@command.check_place?("place")).to be false
    end

    it "accepts all valid commands when robot is placed" do
      @command.verify?("PLACE 3,2,SOUTH")
      #sets @instruction with valid value
      @command.execute
      expect(@command.verify?("LEFT")).to be true
      expect(@command.verify?("RIGHT")).to be true
      expect(@command.verify?("REPORT")).to be true
    end
  end

  context 'formats the command input' do
    it 'capitalises and splits input into an array' do
      result = @command.format("this is input")
      expect(result.length).to eq 3
      expect(result[0]).to eq "THIS"
      expect(result[1]).to eq "IS"
      expect(result[2]).to eq "INPUT"
    end

    it "only allows valid directions" do
      expect(@command.check_place?("1,1,NORTH")).to be true
      expect(@command.check_place?("1,1,NORth")).to be false
      expect(@command.check_place?("1,1,MRSNIPS")).to be false
    end

    it "correctly formats place command (integer, integer, string)" do
      result = @command.format_place("1,1,WEST")
      expect(result[:x]).to be_kind_of(Integer)
      expect(result[:y]).to be_kind_of(Integer)
      expect(result[:direction]).to be_kind_of(String)
    end

    it "sets instruction correctly for place command" do
      command = Command.new
      result = {x: 3, y: 2, direction: "WEST"}
      command.set_instruction(["PLACE","3,2,WEST"])
      expect(command.instruction[:command]).to eq "PLACE"
      expect(command.instruction[:place]).to eq result
    end

    it "sets instruction correctly for move, left, right, report commands" do
      command = Command.new
      command.set_instruction(["MOVE"])
      expect(command.instruction[:command]).to eq "MOVE"
      expect(command.instruction[:direction]).to eq nil
    end



  end


end
