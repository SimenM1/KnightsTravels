#7x7 chess board, knight moves 2 in d1 and 1 in d2, max 8 possible moves
#generate all moves for all squares and link them in a graph
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
      value.possible_moves.push(@positions[position])
    end
  end
end

a = KnightTravels.new()
a.add_positions
a.map_positions

#perform all possible moves until the desired field is reached
#return the moves made