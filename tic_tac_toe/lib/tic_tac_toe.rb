class TicTacToe
    def initialize
      @board = Array.new(3) { Array.new(3, '-') }
      print "Player 1 name: "
      @player1 = gets.chomp
      print "Player 2 name: "
      @player2 = gets.chomp
      @player1turn = true
    end

    def draw_board(board)
        board.each do |row|
          row.each do |cell|
            print cell
          end
          puts
        end
    end

    def player_has_won(board)
        (0..2).each do |i|
          if board[i][0] == board[i][1] && board[i][1] == board[i][2] && board[i][0] != '-'
            return board[i][0]
          end
        end

        (0..2).each do |j|
          if board[0][j] == board[1][j] && board[1][j] == board[2][j] && board[0][j] != '-'
            return board[0][j]
          end
        end

        if board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0] != '-'
          return board[0][0]
        end
        if board[2][0] == board[1][1] && board[1][1] == board[0][2] && board[2][0] != '-'
          return board[2][0]
        end

        ' '
      end
      
    def board_is_full(board)
        board.each do |row|
            row.each do |cell|
            return false if cell == '-'
            end
        end
        true
    end
      
    def play
        game_ended = false

        loop do
            break if game_ended
            draw_board(@board)
            c = "-"
            if @player1turn
                puts @player1 + "'s turn (x): "
                c = "x"
            else
                puts @player2 + "'s turn (o): "
                c = "o"
            end

            while true do
                print "Enter a row number (0, 1, or 2): "
                row = gets.chomp.to_i
                print "Enter a column number (0, 1, or 2): "
                col = gets.chomp.to_i

                if row < 0 || col < 0 || row > 2 || col > 2
                    puts "This position is off the bounds of the board! Try again."
                elsif @board[row][col] != '-'
                    puts "Someone has already made a move at this position! Try again."
                else
                    break
                end
            end

            @board[row][col] = c

            if player_has_won(@board) == 'x'
                puts @player1 + " has won!"
                game_ended = true
            elsif player_has_won(@board) == 'o'
                puts @player2 + " has won!"
                game_ended = true
            else
                if board_is_full(@board)
                    puts "It's a tie!"
                    game_ended = true
                else
                    @player1turn = !@player1turn
                end
            end
        end
    end
end

game = TicTacToe.new

game.play
