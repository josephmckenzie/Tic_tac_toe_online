require_relative "gameplayers.rb"
require_relative "messages.rb"
require_relative"gameboard.rb"
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
		assert_equal("Really your gonna play Simple??", message.simple)
		assert_equal("MEDIUM is cool but how about HARD??", message.medium)
		assert_equal("Hard?? You know it cant be beat right?", message.negamax)
	end

	
	# def test_for_invalid_message
		# message=Messages.new
		# players = Gameplayers.new
		# choice = Gameboard.new
		# assert_equal("Hey #{players.current} #{choice} is already taken",message.invalid )
	# end

	
	def test_square_available?
	game = Gameboard.new
	assert_equal(true, game.square_available?(1,["1","2","3","4","5","6","7","8","9"]))
	# assert_equal(false,game.square_available?(4,["1","2","3","4","5","6","7","8","9"]))
	end
	
	def test_p1_p2_markers
		game = Gameplayers.new
		
		player1 = "O"
		assert_equal("X", game.p2)
		assert_equal("O", player1)
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