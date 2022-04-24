class HumanPlayer

  def prompt
    puts "please input 2 numbers"
    input = gets.chomp
    input_array = input.split(" ")
    pos = input_array.map { |ele|  ele.to_i}
    pos
  end

  def receive_revealed_card(pos, value)
    
  end
end