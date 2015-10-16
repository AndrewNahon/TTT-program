#ttt game

#Psuedo code
#1. Create an empty board in hash form
#2. Display board
#3. Player moves
  #a. validates move
    #between 1--9, available square
  #b.  checks for win or tie
  #c.  displays board
#.Computer moves
  #a. moves to win, to block, or random available space
  #. check for win or tie

#4. Displays winner
#5. Ask do you want to play again? Repeat unless no.

WINNING_LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

def create_board
  hash = {}
  (1..9).each {|n| hash[n] = ' '}
  hash
end

def display_board(board)
  system 'clear'
  puts " #{board[1]} | #{board[2]} | #{board[3]}"
  puts "-----------"
  puts " #{board[4]} | #{board[5]} | #{board[6]}"
  puts "-----------"
  puts " #{board[7]} | #{board[8]} | #{board[9]}"
end

def player_move(board)
  
  puts "Make your move. Choose an available square (1--9)"
  move = gets.chomp.to_i
  
  until board[move] == ' '
    puts "You must select an empty square between 1--9"
    move = gets.chomp.to_i
  end
  
  board[move] = 'x'
  display_board(board)
end

def computer_move(board)
  #check for two in a row
  if check_for_two(board)
    move = check_for_two(board)
    board[move] = 'o'
  else
  #pick a random available square
  move = (board.select {|_, v| v == ' '}.keys.sample)
  board[move] = 'o'
  end
  
  display_board(board)
end

def check_for_two(board)
  WINNING_LINES.each do |line|
    array = [board[line[0]], board[line[1]], board[line[2]]]
    if array.count('o') == 2 && array.count(' ') == 1 
      return line[array.index(' ')]
    elsif array.count('x') == 2 && array.count(' ') == 1 
      return line[array.index(' ')]
    end  
  end
  nil
end

def check_for_winner(board)
  WINNING_LINES.each do |line|
    if board[line[0]] == 'o' && board[line[1]] == 'o' && board[line[2]] == 'o'
      return "Computer"
    elsif board[line[0]] == 'x' && board[line[1]] == 'x' && board[line[2]] == 'x'
      return "Player"
    end
  end
  nil
end

def game_over?(board, winner)
  board.values.include?(' ') == false || winner
end

begin 

  board = create_board
  display_board(board)

  begin
      player_move(board)
      winner = check_for_winner(board)
     
      if game_over?(board, winner)
        break
      end
      computer_move(board)
      winner = check_for_winner(board)
      
      if game_over?(board, winner)
        break
      end
  end until game_over?(board, winner)
  
  if winner
    puts "#{winner} won!"
  else
    puts "It's a tie"
  end

  puts ''
  puts "Would you like to play again??"
  puts "Enter yes or no."
  play_again = gets.chomp.downcase

end until play_again == 'no' || play_again == 'n'







