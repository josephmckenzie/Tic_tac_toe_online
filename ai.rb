class Random

	
	attr_accessor :level,  :play_board, :players

	def initialize
		@play_board = Gameboard.new
		@players = Gameplayers.new
		@level = ""
	end
	
	def computer_move(level)
		
		n = rand(0..8)
			if play_board.square_available?(n) == false
				computer_move(level)
			else
				return n
			end
	end

end
