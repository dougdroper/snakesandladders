Given /^a board with:$/ do |table|
  @s_a_l = table.hashes.map {|b|  {b["from"].to_i, b["to"].to_i}  }
end

Given /^I start a game with (\d+) players$/ do |count|
  @players = Array.new(count.to_i) { {:pos => 0} }
end

Given /^player (\d+) rolls (\d+)$/ do |player, roll_num|
  @players[player.to_i - 1][:pos] += roll_num.to_i
  s_or_l = @s_a_l.select {|x| x.keys.include? @players[player.to_i - 1][:pos]}
  @players[player.to_i - 1][:pos] = s_or_l.first.first.last unless s_or_l.empty?
end

Given /^player (\d+) is on position (\d+)$/ do |player, pos|
  @players[player.to_i - 1][:pos] = pos.to_i
end

Then /^player (\d+) is now on position (\d+)$/ do |player, pos|
  @players[player.to_i - 1][:pos] = 100 - (@players[player.to_i - 1][:pos] - 100) if @players[player.to_i - 1][:pos] > 100
  @players[player.to_i - 1][:pos].should == pos.to_i
end

Then /^player (\d+) has won the game$/ do |player|
  (@players[player.to_i - 1][:pos] == 100 ? true : false).should be_true
end

Then /^it is now player (\d+)'s go$/ do |arg1|
    
end
