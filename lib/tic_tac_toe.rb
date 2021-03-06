#helper methods
# Helper Methods
 WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end


def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board) #counts occupied positions

counter= 0
board.each do |element|
  if element== "X" || element== "O" #if_my_condition_is_met
 counter +=1
 end
end
counter  #after .each do returns array, i need to put counter to get a number
end

 def current_player(board)
   if turn_count(board) %2 == 0
     "X"                                  #"puts" method will return nil
   else
      "O"
  end
 end

 def move(board, index, current_player)
   board[index] = current_player
 end



 def won?(board)
     WIN_COMBINATIONS.each do |win_combination|

   win_index_1 = win_combination[0]
   win_index_2 = win_combination[1]
   win_index_3 = win_combination[2]
   position_1 = board[win_index_1] # load the value of the board at win_index_1
   position_2 = board[win_index_2] # load the value of the board at win_index_2
   position_3 = board[win_index_3] # load the value of the board at win_index_3
 if position_1 == "X" && position_2 == "X" && position_3 == "X" ||position_1 == "O" && position_2 == "O" && position_3 == "O"
     return win_combination
   end
 end
 else
   return false
 end


 def full?(board)
   board.all? do |element|
      element == "X" || element == "O"
     end
   end

 def draw?(board)
   # what defines a draw? not won?(board), and the board is full?(board)

   !won?(board) && full?(board)

   #  board.!WIN_COMBINATIONS do |element|
   #    if full?(board)
   #      true
   #
 end
    def over?(board)
      won?(board) || draw?(board)
    end

 def winner(board)
   if won?(board) # [0,1,2]
      board[won?(board)[0]]
   end
 end
 # Define your play method below
 def play(board)
   # we will make turns 'until' the game is over
   until over?(board)
    turn(board)
  end

  if winner(board)
    puts "Congratulations #{winner(board)}!"
  else
     puts "Cat's Game!"
 end
end 
