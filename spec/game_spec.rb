require File.expand_path("#{File.dirname(__FILE__)}/spec_helper")

describe Game do
  before :all do
    @game = Game.new(2, Board.new([{"from"=>"3", "to"=>"2"}, {"from"=>"5", "to"=>"10"}]))
  end

  it "create the correct amount of players" do
    @game.players.count.should == 2
  end

  it "set the correct numbers on the players" do
    @game.players.first.number.should == 1
    @game.players.last.number.should == 2
  end

  it "should set the current player to player 1" do
    @game.current_player.should == @game.players.first
  end

  it "should switch current player" do
    @game.current_player.number.should == 1
    @game.send(:switch_current_player)
    @game.current_player.number.should == 2
  end

  it "should know if a player has won" do
    @game.current_player.position = 100
    @game.player_has_won?(@game.current_player).should be_true
  end

  it "should know if a player has not won" do
    @game.current_player.position = 99
    @game.player_has_won?(@game.current_player).should be_false
  end
end