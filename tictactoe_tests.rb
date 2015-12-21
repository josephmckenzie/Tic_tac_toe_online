
require_relative "messages.rb"
require "minitest/autorun"

class Tictactoe_tests < Minitest::Test


	def test_for_lets_play_message 
		message = Messages.new
		assert_equal("Lets Play Some Tic-Tac-Toe",message.play)
	end
	
	def test_for_game_type_message
	message=Messages.new
	assert_equal("You Chose a 1 Player VS the Computer Game",message.one_player)
	assert_equal("You Chose a 2 player game",message.two_player)
	end

	
	def test_for_level_message
	message=Messages.new
	assert_equal("Really your gonna play EASY??",message.easy)
	assert_equal( "Really your gonna play Mild?? Mild is a sauce not a difficulty.",message.mild)
	end
end

	# def test_start_game_board
		# board = Gameboard.new
		# assert_equal(['1','2','3','4','5','6','7','8','9'], board.board)
		# end


	# def test_for_valid_marker
		# player = Gameplayers.new
		# assert_equal("X",player.p2)
		# end
			
	# def test_valid_move
		# game = Gameboard.new 
		# game.board[0] = "X"
		# assert_equal(true,game.square_available?(1))
		# assert_equal(false,game.square_available?(0))
		# end
	

	# def test_random_move
		# board = Easy.new
		# position = board.computer_move(board)
		# assert_equal(true, [1,2,3,4,5,6,7,8,9].include?(position))
		# assert_equal(false,[11].include?(position))
	
	# end
	
	# def test_update_board
		# game = Gameboard.new 
		# game.board[0] = "X"
		# assert_equal(["X", "2", "3", "4", "5", "6", "7", "8", "9"], game.board )
		
		# end
		
# end