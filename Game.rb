require_relative "Board.rb"
require_relative "HumanPlayer.rb"
require_relative "ComputerPlayer.rb"

class Game
  def initialize(board, player)
    @board = board
    @previous_guess = nil
    @player = player
  end

  def play
    while !@board.won?
      system("clear")
      @board.render
      pos = @player.prompt
      make_guess(pos)
      sleep(0)
    end
  end

  def make_guess(pos)
    if @board[pos].face_value != "-"
      return
    end
    @board.reveal(pos)
    @board.render
    @player.receive_revealed_card(pos, @board[pos].face_value)
    if @previous_guess
      if @board[@previous_guess].face_value != @board.reveal(pos)
        @board[@previous_guess].hide
        @board[pos].hide
      end
      @previous_guess = nil
    else
      @board.reveal(pos)
      @previous_guess = pos
    end
  end

end

board = Board.new(4)
board.populate
bob = HumanPlayer.new()
jim = ComputerPlayer.new(board.size)
game = Game.new(board, jim)
game.play