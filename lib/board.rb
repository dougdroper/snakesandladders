class Board
  BOARD_SIZE = 100
  attr_reader :board
  def initialize(snakes_and_ladders)
    set_up_board
    snakes_and_ladders.each do |s|
      position_piece s["from"].to_i, s["to"].to_i
    end
  end

  def set_up_board
    @board = Array.new(BOARD_SIZE, "")
  end

  def position_piece from, to
  	@board[from] = to
  end
end