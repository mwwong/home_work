class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do | cup, idx |
      if idx != 6 && idx != 13
        4.times { cup << :stone} 
      end
    end
  end
  
  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 12
      raise 'Invalid starting cup'
    end
    if @cups[start_pos].empty?
       raise 'Starting cup is empty'
    end
  end

  def make_move(start_pos, current_player_name)
     taken_stone = @cups[start_pos]
     @cups[start_pos] = []
     until taken_stone.empty?
      startpos += 1
      if start_pos > 13
        start_pos = 0
      end
        if start_pos == 6 && current_player_name == @name1
          @cups[6] << taken_stone.pop 
        elsif start_pos == 13 && current_player_name == @name2
          @cups[13] << taken_stone.pop
        else
          @cups[start_pos] << taken_stone.pop
        end
      end
      render
      next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cup[ending_cup_idx].count == 1
      :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
     return @cups[0..5].all? { |cup| cup.empty? } || @cups[7..12].all? {| cup | cup.empty?}
     
  end

  def winner
    player_1 = @cups[6].count
    player_2 = @cups[13].count
    if player_1 > player_2
      @name1
    elsif player_2 > player_1
      @name2
    else
      :draw
    end
  end
end
