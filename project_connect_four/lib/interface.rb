# frozen_string_literal: true

require_relative 'grid'
class Interface
  def self.display_grid(grid)
    puts " 0 1 2 3 4 5 6"
    puts "---------------"
    (0..(grid.rows - 1)).each do |row|
      print "|"
      (0..(grid.cols - 1)).each do |col|
        print grid[row, col]
        print "|"
      end
      puts
      puts "---------------"
    end
    puts " 0 1 2 3 4 5 6"
    puts
  end

  def self.get_column_choice(player_name)
    print "Player #{player_name}, choose a column: "
    gets.chomp.to_i
  end

  def self.display_winner(player_name)
    puts "#{player_name} won"
  end

  def self.display_tie_game
    puts "Tie game"
  end
end