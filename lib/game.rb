class Game

  attr_accessor :current_player
  attr_accessor :players

  def initialize(players, board)
    @board = board
  	@players = []
  	players.times do |number|
      @players[number] = Player.new(number + 1)
	  end
    @current_player = @players.first
  end

  def play_turn number
    @current_player.roll number.to_i
    player_lands_on_ladder_or_snake unless @current_player.position == 100
    switch_current_player unless number.to_i == 6
  end

  def switch_current_player
    temp = @players.shift
    @players << temp
    @current_player = @players.first
  end

  def player_lands_on_ladder_or_snake
    if @board.board[(@current_player.position)] != ""
      @current_player.position = @board.board[@current_player.position]
    end
  end

  def player number
    @players.select{|p| p.number == number.to_i}.first
  end

  def player_has_won? player
    player.position.to_i == 100
  end
end
