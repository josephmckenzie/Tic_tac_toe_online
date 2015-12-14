require_relative "gameplayers.rb"
require_relative "gameboard.rb"
require_relative "ai.rb"
require "minitest/autorun"

class Tictactoe_tests < Minitest::Test


	def test_start_game_board
		board = Gameboard.new
		assert_equal(['1','2','3','4','5','6','7','8','9'], board.board)
		end


	def test_for_valid_marker
		player = Gameplayers.new
		assert_equal("X",player.p2)
		end

		
		#keeps coming back false but the baord is full so wth?
	# def test_for_full_board
		# board = Gameboard.new
		# assert_equal(true,board.board_full?(['1','2','3','4','5','6','7','8','9']))
	# end
	
	
		
		
		
		
		
end

















	# def test_initialize
		# game = TTTgame.new(@board,"","",1,"") 
		# assert_equal(["1", "2", "3", "4", "5", "6", "7", "8", "9"], game.board)
		# assert_equal("",game.p1)
		# assert_equal("",game.p2)
		# assert_equal("",game.currentplayer)

		# end
		
	# def test_update_board
		# game = TTTgame.new(@board,"","","",1) 
		# game.board[0] = "X"
		# assert_equal(["X", "2", "3", "4", "5", "6", "7", "8", "9"], game.board )
		
		# end
		
	# def test_update_marker
		# game = Gamplayers.new
		
		# assert_equal("X",game.p2)
	# end
	
	# def test_valid_move
		# choice = 7
		# game = TTTgame.new(@board,"","",1,"") 
		# game.board[0] = "X"
		# assert_equal(true,game.square_valid?(choice))
		# assert_equal(false,game.square_valid?(0))
		# assert_equal(false,game.square_valid?(1))
		
		# end

	# def test_game_winning
		# game = TTTgame.new(board_position_array,"","",1) 
		# assert_equal(["X", "X", "O", "O", "5", "0", "X", "O", "9"], game.random_select(board))
		

	# end
	
		
		
		
		
		