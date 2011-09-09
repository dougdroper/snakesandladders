Given /^a board with:$/ do |table|
  SnakesAndLadders.new(table.hashes)
end