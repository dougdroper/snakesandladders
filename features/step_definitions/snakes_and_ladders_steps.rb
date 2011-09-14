Given /^a board with:$/ do |table|
  @board = Board.new(table.hashes)
end

Given /^I start a game with (\d+) players$/ do |number_of_players|
  @game = Game.new(number_of_players.to_i, @board)
end

Given /^player (\d+) rolls (\d+)$/ do |player_number, number|
  @game.play_turn number
end

Then /^player (\d+) is now on position (\d+)$/ do |player_number, position|
  @game.player(player_number.to_i).position.should == position.to_i
end

Given /^player (\d+) is on position (\d+)$/ do |player_number, position|
  @game.player(player_number.to_i).position = position.to_i
  @game.player(player_number.to_i).position.should == position.to_i
end

Then /^player (\d+) has won the game$/ do |player_number|
  @game.player_has_won?(@game.player(player_number.to_i)).should == true
end

Then /^it is now player (\d+)'s go$/ do |player_number|
  @game.current_player.number.to_i.should == player_number.to_i
end