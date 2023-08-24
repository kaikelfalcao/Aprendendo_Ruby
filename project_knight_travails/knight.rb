class KnightMoves
  def initialize
    @moves = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
  end

  def within_board?(x, y)
    x >= 0 && x < 8 && y >= 0 && y < 8
  end

  def knight_moves(start, target)
    visited = {}
    queue = [start]

    until queue.empty?
      current_square = queue.shift
      return build_path(visited, start, target) if current_square == target

      x, y = current_square
      @moves.each do |dx, dy|
        new_x, new_y = x + dx, y + dy
        next unless within_board?(new_x, new_y)

        new_square = [new_x, new_y]
        unless visited.key?(new_square)
          visited[new_square] = current_square
          queue.push(new_square)
        end
      end
    end

    []
  end
  def build_path(visited, start, target)
    path = [target]
    while path.last != start
      path.push(visited[path.last])
    end
    path.reverse
  end
end

def knight_moves(start, target)
  knight = KnightMoves.new
  knight.knight_moves(start, target)
end

puts "You made it in #{knight_moves([3,3],[4,3]).length - 1} moves! Here's your path:"
p knight_moves([3,3],[4,3])