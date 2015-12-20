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
			
	def test_valid_move
		game = Gameboard.new 
		game.board[0] = "X"
		assert_equal(true,game.square_available?(1))
		assert_equal(false,game.square_available?(0))
		end
	

	def test_random_move
		board = Easy.new
		position = board.computer_move(board)
		assert_equal(true, [1,2,3,4,5,6,7,8,9].include?(position))
		assert_equal(false,[11].include?(position))
	
	end
	
	def test_update_board
		game = Gameboard.new 
		game.board[0] = "X"
		assert_equal(["X", "2", "3", "4", "5", "6", "7", "8", "9"], game.board )
		
		end
		
end