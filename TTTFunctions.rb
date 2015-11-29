class TTTgame
   attr_accessor :board, :player1, :player2, :current, :mode
  def initialize(board, player1, player2, current, mode)
    @board = board_position_array
    @player1 = player1
    @player2 = player2
    @current = current
    @mode = mode
  end

  def board_position_array
    ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end

  def random_select(board)
    array = rand(1..9)
    if square_valid?(array,board) == false
      random_select(board)
    else
      player_marker = current_player()
      board[array - 1] = player_marker
    end
  end
  

  def marker_valid?(player1) 
   player1 == "X" || player1 == "O"
  end


  def p2(player1)
    if  player1 == "X"
      player2 = "O"
    else player2 = "X"
    end
  end

  def square_valid?(choice, gameboard)
    choice >= 1 && choice <= 9 && gameboard[choice - 1] != "X" && gameboard[choice - 1] != "O"   
  end

  def current_player
    if current == 1
      player1
    else
    player2
    end
  end
 
  def switch_players 
    if current == 1
      current = 2
    else current = 1
    end
  end
 
  def is_board_full?(squares)
    board = squares.join(",")
    if board =~ (/\d/)
      false
    else
      true
    end
  end
 
  def win(board)
     if board[0] == "X" && board[1] == "X" && board[2] == "X" ||
      board[3] == "X" && board[4] == "X" && board[5] == "X" ||
      board[6] == "X" && board[7] == "X" && board[8] == "X" ||
      board[0] == "X" && board[3] == "X" && board[6] == "X" ||
      board[1] == "X" && board[4] == "X" && board[7] == "X" ||
      board[2] == "X" && board[5] == "X" && board[8] == "X" ||
      board[0] == "X" && board[4] == "X" && board[8] == "X" ||
      board[2] == "X" && board[4] == "X" && board[6] == "X" ||
      board[0] == "O" && board[1] == "O" && board[2] == "O" ||
      board[3] == "O" && board[4] == "O" && board[5] == "O" ||
      board[6] == "O" && board[7] == "O" && board[8] == "O" ||
      board[0] == "O" && board[3] == "O" && board[6] == "O" ||
      board[1] == "O" && board[4] == "O" && board[7] == "O" ||
      board[2] == "O" && board[5] == "O" && board[8] == "O" ||
      board[0] == "O" && board[4] == "O" && board[8] == "O" ||
      board[2] == "O" && board[4] == "O" && board[6] == "O"
    true
    else
    false
    end
  end
  
  
def computer_ai

if board
  
  
  
  
  
  
  
  
  
  
  
  # def game_end?(squares)

# win(board) || is_board_full?(squares)

# end


 
  
  
  
  
  

end

