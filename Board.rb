require_relative "Card.rb"

class Board
  attr_reader :size

  def initialize(board_size)
    @board = []
    @size = board_size
  end

  def populate
    alphabet = ["A", "B", "C", 'D', "E", "F", "G", "H", "i", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "X", "Y", "Z"]
    values = []
    (@size * 2).times do |i|
      values.push(alphabet[i])
      values.push(alphabet[i])
    end
    shuffled = values.shuffle

    (@size).times do |i|
      row = []
      @size.times do |q|
        card = Card.new(shuffled[q + (i * 4)])
        row.push(card)
      end
      @board.push(row)
    end
    render
  end

  def render
    puts "------------------"
    @board.each do |row|
      row.each do |card|
        print card.face_value + " "
      end
      puts
    end
  end

  def won?
    @board.each do |row|
      row.each do |card|
        return false if card.face_value == "-"
      end
    end
    true
  end

  def reveal(guessed_pos)
    row, col = guessed_pos
    selected_card = @board[row][col]
    selected_card.reveal
    selected_card.face_value
  end

  def [](guessed_pos)
    row, col = guessed_pos
    selected_card = @board[row][col]
    selected_card
  end
end


# game_board = Board.new(4)
# game_board.populate
# game_board.reveal([0, 0])
# game_board.render