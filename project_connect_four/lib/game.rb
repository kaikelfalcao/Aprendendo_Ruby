# frozen_string_literal: true

require_relative 'grid'
require_relative 'interface'
require_relative 'player'
class Game
  def initialize(player_1,player_1_symbol, player_2,player_2_symbol)
    @grid = Grid.new(6, 7)
    @turn = 1
    @players = [Player.new(player_1, player_1_symbol), Player.new(player_2, player_2_symbol)]
    @current_player_index = 0
    @winner = false
  end

  def play
    loop do
      reset_game
      until @winner || @turn > 42
        play_turn
        break if @winner
        @current_player_index = (@current_player_index + 1) % 2
        @turn += 1
      end
      display_winner

      break unless play_again?
    end
  end

  def reset_game
    @grid = Grid.new(6, 7)
    @turn = 1
    @current_player_index = 0
    @winner = false
  end

  def play_again?
    print "Do you want to play again? (y/n): "
    response = gets.chomp.downcase
    response == 'y'
  end
  private

  def play_turn
    valid_play = false
    play = 0

    until valid_play
      Interface.display_grid(@grid)
      player = @players[@current_player_index]
      play = Interface.get_column_choice(player.name)
      valid_play = validate_play(play)
    end

    drop_checker(play)
    @winner = check_winner
  end

  def validate_play(column)
    column >= 0 && column < @grid.cols && @grid[0, column] == ' '
  end

  def drop_checker(column)
    (@grid.rows - 1).downto(0) do |row|
      if @grid[row, column] == ' '
        @grid[row, column] = @players[@current_player_index].symbol
        break
      end
    end
  end

  def check_winner
    return true if check_horizontal || check_vertical || check_diagonal_up || check_diagonal_down
    false
  end

  def check_horizontal
    (0..(@grid.rows - 1)).each do |row|
      (0..(@grid.cols - 4)).each do |col|
        player_symbol = @players[@current_player_index].symbol
        return true if @grid[row, col] == player_symbol &&
          @grid[row, col + 1] == player_symbol &&
          @grid[row, col + 2] == player_symbol &&
          @grid[row, col + 3] == player_symbol
      end
    end
    false
  end

  def check_vertical
    (0..(@grid.rows - 4)).each do |row|
      (0..(@grid.cols - 1)).each do |col|
        player_symbol = @players[@current_player_index].symbol
        return true if @grid[row, col] == player_symbol &&
          @grid[row + 1, col] == player_symbol &&
          @grid[row + 2, col] == player_symbol &&
          @grid[row + 3, col] == player_symbol
      end
    end
    false
  end

  def check_diagonal_up
    (3..(@grid.rows - 1)).each do |row|
      (0..(@grid.cols - 4)).each do |col|
        player_symbol = @players[@current_player_index].symbol
        return true if @grid[row, col] == player_symbol &&
          @grid[row - 1, col + 1] == player_symbol &&
          @grid[row - 2, col + 2] == player_symbol &&
          @grid[row - 3, col + 3] == player_symbol
      end
    end
    false
  end

  def check_diagonal_down
    (0..(@grid.rows - 4)).each do |row|
      (0..(@grid.cols - 4)).each do |col|
        player_symbol = @players[@current_player_index].symbol
        return true if @grid[row, col] == player_symbol &&
          @grid[row + 1, col + 1] == player_symbol &&
          @grid[row + 2, col + 2] == player_symbol &&
          @grid[row + 3, col + 3] == player_symbol
      end
    end
    false
  end


  def switch_player
    @current_player_index = (@current_player_index + 1) % 2
  end

  def display_winner
    if @winner
      winner_player = @players[@current_player_index].name
      Interface.display_winner(winner_player)
    else
      Interface.display_tie_game
    end
  end
end
