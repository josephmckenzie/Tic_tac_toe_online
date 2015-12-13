
module Players
	class Gameplayers
		attr_accessor :player1, :player2, :current, :type
		
		def initialize
			@player1 = ""
			@player2 = ""
			@current = 1
			@type = ""
		end
		
		def p2
			if	player1 == "X"
			 "O" 
			else
			 "X"
		end
		end
		
		def current_player
		if	current == 1 
			player1 
		else
			player2
		end
		end
		
		def opposite_player
		if	current == 1 
			player2 
		else	
			player1
		end
		end
		
		def change
		if current == 1 
		   current = 2 
		else current = 1
		end
		end
	end
end

module Board
	class Gameboard
		attr_accessor :board, :winning_routes

		def initialize
			@board = ["1","2","3","4","5","6","7","8","9"]
			@winning_routes = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
		end
		
		def square_available?(choice)
			board[choice] != "X" && board[choice] != "O"
		end
		
		def board_full?
			board_tos = board.join(",")
			board_tos =~ (/\d/) ? false : true
		end
		
		def winner?(player)
			result = false
			winning_routes.each do |group|
				if board[group[0]] == player && board[group[1]] == player && board[group[2]] == player
					result = true
				end
			end
			result
		end
	end
end

class AI
	include Board
	include Players
	
	attr_accessor :level, :fork_routes, :play_board, :players

	def initialize
		@play_board = Gameboard.new
		@players = Gameplayers.new
		@level = ""
		@fork_routes = [[0,2,6],[0,2,8],[0,6,8],[2,6,8],[0,2,5],[0,2,3],[5,6,8],[3,6,8],[0,2,4],[2,4,8],[0,4,6],[6,4,8]]
	end
	
	def computer_move(level)
		case level
			when "easy"
			computer_random_move()
			
			when "medium"
			if computer_winning_move()
			elsif computer_blocking_move()
			elsif computer_fork_move()
			elsif computer_fork_block()
			elsif @medium_move = computer_random_move()
			end
			return @medium_move
			
			when "hard"
			depth = 1
			player_marker = players.current_player()
			negamax(play_board.board, player_marker, depth)
			return @best_move
		end
	end
	
	def computer_random_move
		n = rand(0..8)
			if play_board.square_available?(n) == false
				computer_random_move()
			else
				return n
			end
	end

	def negamax(board, mark, depth)
		mark == "O" ? opponent = "X" : opponent = "O"
		if play_board.winner?(mark) || play_board.board_full?()
			return game_result(mark, opponent)
		else 
			max = -1.0/0
			available_moves.each do |space|
				board[space] = mark
				score = -negamax(board, opponent, depth + 1)
				board[space] = "#{space + 1}"
				if score > max
					max = score
					if depth == 1
					@best_move = space
					end
				end
			end
			return max
		end
	end
	
	def available_moves()
		play_board.board.each_index.select { |s| play_board.board[s] != "X" && play_board.board[s] != "O"}
	end
	
	def game_result(mark, opponent)
		if play_board.winner?(mark)
			return 1
		elsif play_board.winner?(opponent)
			return -1
		else 
			return 0
		end
	end
	
	def computer_winning_move
		player_marker = players.current_player()
		move = false
		play_board.winning_routes.each do |group|
		count = 0
			group.each do |value|
				count += 1 if play_board.board[value] == player_marker
			end
			
			if count == 2
				group.each do |value|
					if play_board.board[value] != "X" && play_board.board[value] != "O"
						@medium_move = value
						move = true
					end
				end
			end
		break if move == true
		end
		move
	end
	
	def computer_blocking_move
		player_marker = players.current_player()
		opponent = players.opposite_player()
		move = false
		play_board.winning_routes.each do |group|
		count = 0
			group.each do |value|
				count += 1 if play_board.board[value] == opponent
			end
			
			if count == 2
				group.each do |value|
					if play_board.board[value] != "X" && play_board.board[value] != "O"
						@medium_move = value
						move = true
					end
				end
			end
		break if move == true
		end
		move
	end
	
	def computer_fork_move
		player_marker = players.current_player()
		move = false
		fork_routes.each do |group|
		count = 0
			group.each do |value|
				count += 1 if play_board.board[value] == player_marker
			end
			
			if count == 2
				group.each do |value|
					if play_board.board[value] != "X" && play_board.board[value] != "O"
						@medium_move = value
						move = true
					end
				end
			end
		break if move == true
		end
		move
	end
	
	def computer_fork_block
		player_marker = players.current_player()
		opponent = players.opposite_player()
		move = false
		fork_routes.each do |group|
		count = 0
			group.each do |value|
				count += 1 if play_board.board[value] == opponent
			end
			
			if count == 2
				group.each do |value|
					if play_board.board[value] != "X" && play_board.board[value] != "O"
						@medium_move = value
						move = true
					end
				end
			end
		break if move == true
		end
		move
	end
end
