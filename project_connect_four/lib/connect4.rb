require_relative  'game'

print "Player 1 name: "
player_1 = gets.chop
print "Player 1 symbol: "
player_1_symbol = gets.chop

print "Player 2 name: "
player_2 = gets.chop
print "Player 2 symbol: "
player_2_symbol = gets.chop

game = Game.new(player_1,player_1_symbol, player_2,player_2_symbol)
game.play