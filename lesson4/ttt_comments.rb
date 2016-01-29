# Tic Tac Toe

#   1. Display initial empty 3x3 board.
#   2. Ask the user to mark a square.
#   3. Computer marks a square.
#   4. Display updated board state.
#   5. If winner, display winner.
#   6. If board is full, display tie.
#   7. If neither winner nor board is full, go to step 2.
#   8. Ask if the user would like to play again.
#   9. If yes, go to step 1.
#   10. If no, exit.

require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "#{msg}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "Player is #{PLAYER_MARKER}, Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

loop do
  def initialize_board
    new_board = {}
    (1..9).each { |num| new_board[num] = INITIAL_MARKER } # new_board[num] creates new k,v pair in hash. braket syntax to create new key, value = ' '
    new_board
  end

  def empty_squares(brd)
    brd.keys.select { |num| brd[num] == INITIAL_MARKER }
    # brd[num] == ' ' returns all keys where the value is a space. That indicates the square has not been taken yet.
  end

  # for a method to modify a local variable, we first have to pass it in
  # if we do anything in the method that mutates the object, it will be visible outside the method
  def player_places_piece!(brd)
    square = ''   # need to create square variable outside loop so it's accessible when loop ends
    loop do
      prompt "Choose a square (#{empty_squares(brd).join(', ')}):"
      square = gets.chomp.to_i
      break if empty_squares(brd).include?(square)
      prompt "Sorry, that's not a valid choice."
    end

    brd[square] = PLAYER_MARKER
  end

  def computer_places_piece!(brd)
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end

  def board_full?(brd)
    empty_squares(brd).empty?  # checking to see if array is empty, because that means all spaces have been taken
  end

  def someone_won?(brd)
    !!detect_winner(brd)    # !! converts the value to boolean
  end

  def detect_winner(brd)
    WINNING_LINES.each do |line|
    # here we are checking the indexes of the arrays
    
    #   if brd[line[0]] == PLAYER_MARKER &&
    #     brd[line[1]] == PLAYER_MARKER &&
    #     brd[line[2]] == PLAYER_MARKER
    #     return 'Player'
    #   elsif brd[line[0]] == COMPUTER_MARKER &&
    #         brd[line[1]] == COMPUTER_MARKER &&
    #         brd[line[2]] == COMPUTER_MARKER
    #     return 'Computer'
    #   end
    
    # if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
    #   return "Player"
    # elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
    #   return "Computer"
    # end
      
      if brd.values_at(*line).count(PLAYER_MARKER) == 3
        return "Player"
      elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
        return "Computer"
      end
    end  
    nil
  end

  board = initialize_board

  loop do
    display_board(board)      # board keeps track of state of game, so you can't just pass initialize_board here

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} wins!"
  else
    prompt "It's a tie!"
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')

end

prompt "Thanks for playing Tic Tac Toe!"