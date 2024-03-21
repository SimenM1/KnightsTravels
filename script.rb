class Node
  attr_accessor(:position, :possible_moves)

  def initialize(value)
    @position = value
    @possible_moves = []
  end

  def add_moves(nextNode)
    @possible_moves.push(nextNode)
  end
end

class KnightTravels
  def initialize()
    @positions = {}
    add_positions()
    map_positions()
  end

  def add_positions
    for a in 0..7 do
      for b in 0..7 do
        finder = "#{a}#{b}"
        @positions[finder] = Node.new([a, b])
      end
    end
  end

  def map_positions()
    @positions.each do |key, value|
      current_position = value.position
      position_1 = "#{current_position[0] + 2}#{current_position[1] + 1}"
      add_possible_move(position_1, value)
      position_2 = "#{current_position[0] - 2}#{current_position[1] - 1}"
      add_possible_move(position_2, value)
      position_3 = "#{current_position[0] + 2}#{current_position[1] - 1}"
      add_possible_move(position_3, value)
      position_4 = "#{current_position[0] - 2}#{current_position[1] + 1}"
      add_possible_move(position_4, value)
      position_5 = "#{current_position[0] + 1}#{current_position[1] + 2}"
      add_possible_move(position_5, value)
      position_6 = "#{current_position[0] - 1}#{current_position[1] - 2}"
      add_possible_move(position_6, value)
      position_7 = "#{current_position[0] + 1}#{current_position[1] - 2}"
      add_possible_move(position_7, value)
      position_8 = "#{current_position[0] - 1}#{current_position[1] + 2}"
      add_possible_move(position_8, value)      
    end
  end

  def add_possible_move(position, value)
    if @positions.key?(position)
      value.possible_moves.push(position)
    end
  end

  def knight_moves(start, finish)
    start_key = "#{start[0]}#{start[1]}"
    previous_moves = []
    queue = [[@positions[start_key], ""]]
    while queue.length > 0
      current_with_previous = queue.pop()
      current_with_previous[1]
      current = current_with_previous[0]
      previous = current_with_previous[1]
      if current.position == finish
        puts "the quickest path is #{previous}"
        return current
      else
        current.possible_moves.each do |key|
          queue.unshift([@positions[key], previous + current.position.to_s])
        end
      end
    end
  end    
end

a = KnightTravels.new()
a.knight_moves([4,5],[1,5])