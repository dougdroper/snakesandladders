require 'lib/board.rb'

class Player

  attr_accessor :number
  attr_accessor :position

  def initialize(number, board)
  	@board = board
  	@position = 0
  	@number = number
  end

  def roll dice_number
  	@position += dice_number.to_i
  	if @position > Board::BOARD_SIZE
  	  @position = Board::BOARD_SIZE - (@position - Board::BOARD_SIZE)
  	end
  end
end