require File.expand_path("#{File.dirname(__FILE__)}/spec_helper")

describe Player do
  it "sets its initail position to 0" do
    player = Player.new 1
    player.position.should == 0    
  end

  it "updates its position" do
    player = Player.new 1
    player.roll 4
    player.position.should == 4
  end

  it "doesn't go higher than 100" do
    player = Player.new 1
    player.position = 96
    player.roll 6
    player.position.should == 98
  end
end