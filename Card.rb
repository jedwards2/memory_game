class Card
  attr_reader :face_value

  def initialize(value)
    @value = value
    @face_value = "-"
  end

  def hide
    @face_value = "-"
  end

  def reveal
    @face_value = @value
  end

  def ==(card)
    return true if card.face_value == @face_value
    false
  end
end