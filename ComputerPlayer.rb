class ComputerPlayer
  attr_reader :known_cards
  def initialize(board_size)
    @known_cards = Hash.new(nil)
    @known_cards[["x", "y"]] = "test"
    @matched_cards = nil
    @previous_guess = nil
    @board_size = board_size
  end


  def prompt 
    if @previous_guess
      @previous_guess = nil
      second_pos = @matched_cards[1]
      @matched_cards = nil
      return second_pos
    elsif @matched_cards
      @previous_guess = @matched_cards[0]
      return @matched_cards[0]
    else
      randomPos = ["x", "y"]
      while @known_cards.keys.include?(randomPos)
        randomPos = [rand(@board_size), rand(@board_size)]
      end
       return randomPos
    end
    
  end

  def receive_revealed_card(pos, value)
    @known_cards.each do |k, v|
      if v == value && !@known_cards.include?(pos)
        receive_match(pos, k)
      end
    end
    @known_cards[pos] = value
  end

  def receive_match(pos1, pos2)
    @matched_cards = [pos1, pos2]
  end
end
