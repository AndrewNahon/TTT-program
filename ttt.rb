#player one chooses
#computer chooses
#check for winner or tie
#displays board
#loops

require 'pry'

def create_board
   hash = {}
  (1..9).each {|n| hash[n] = ' '}
  hash
end 

def draw_board(board)
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}  "
  puts "------------------"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}  "  
  puts "------------------"
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}  "
end

def player_turn(board)
  puts "Choose square (1--9)"
  choice = gets.chomp.to_i
  until board.select {|k, v| v == ' '}.keys.include?(choice)
    puts "You must pick an empty square."
    choice = gets.chomp.to_i
  end
  board[choice] = 'x'
end

def comp_turn(board)
  choice = board.select {|k,v| v == ' '}.keys.sample
  board[choice] = 'o'
end

def tie?(board)
  board.select {|k,v| v == ' '}.keys.empty?
end

def is_there_a_winner(board)
  winning_positions = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9],
                      [3, 5, 7], [3, 5, 7]]
                      
  winning_positions.each do |position|
    if board[position[0]] == 'x' and  board[position[1]] == 'x' and board[position[2]] == 'x'
      return 'Player'
    elsif board[position[0]] == 'o' and board[position[1]] == 'o' and board[position[2]] == 'o'
      return 'Computer'
    else 
      return nil
    end
  end
end


board = create_board
draw_board(board)
#board = { 1 => 'o', 2 => 'o', 3 => 'o'}

begin
  player_turn(board)
  comp_turn(board)
  draw_board(board)
  winner = is_there_a_winner(board)
  puts board
end until winner

if winner
  puts "#{winner} won!"
else
 puts "It's a tie."
end




