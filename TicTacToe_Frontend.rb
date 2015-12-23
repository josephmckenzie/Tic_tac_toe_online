require 'tilt/erb'
require 'sinatra'
require_relative "messages.rb"
require_relative "random.rb"
require_relative "medium.rb"
require_relative "negamax.rb"
require_relative "gameboard.rb"
require_relative "gameplayers.rb"
require_relative "moderately_easy.rb"
require_relative "simple.rb"
message = Messages.new
play_board = Gameboard.new()
players = Gameplayers.new()

ai = ""


get '/tictactoe' do
	erb :OneplayerorTwoplayer, :locals => {:message => message.play , :board => play_board.board}
end

post '/tictactoe' do
	players.type = params[:gametype]
	if players.type == "1"
		erb :howhard, :locals => {:message => message.one_player, :board => play_board.board}
	else
		erb :marker, :locals => {:message => message.two_player, :board => play_board.board}
	end
end

post '/marker' do
		players.level = params[:level] 
		if players.level == "easy"
		ai = Random.new(play_board)
			erb :marker, :locals => {:message => message.easy, :board => play_board.board}
		elsif players.level =="mild"
		ai = ModEasy.new(play_board, players)
			erb :marker, :locals => {:message => message.mild, :board => play_board.board}
		elsif players.level =="simple"
		ai = Simple.new(play_board, players)
			erb :marker, :locals => {:message => message.simple, :board => play_board.board}
		elsif players.level == "medium"
		ai = Medium.new(play_board, players)
			erb :marker, :locals => {:message => message.medium, :board => play_board.board}
		else 	
		ai = Negamax.new(play_board,players)
			erb :marker, :locals => {:message => message.negamax, :board => play_board.board}

		end
end

post '/squares' do
	players.player1 = params[:XorO]
	players.player2 = players.p2()
	erb :squares, :locals => {:p1 => players.player1, :p2 => players.player2, 
							  :invaild => "", :message2 => "Player 1 is #{players.player1} & Player 2 is #{players.player2} ", 
							  :current => players.current, :board => play_board.board, :type => players.type}
end

post '/game' do
	choice = params[:choice].to_i
	player_marker = players.current_player()
	
	if play_board.square_available?(choice - 1) == true
		play_board.board[choice - 1] = player_marker
		redirect to('/status')
	else
		erb :squares, :locals => {:p1 => players.player1, 
								  :p2 => players.player2, 
								  :invaild => "Hey player #{players.current} #{choice} is already taken", 
								  :message2 => "Please choose again.", 
								  :current => players.current, 
								  :board => play_board.board, 
								  :type => players.type}
	end	
end

get '/computerai' do
	player_marker = players.current_player()
	move = ai.computer_move()
	play_board.board[move] = player_marker
		redirect to('/status')
end

get '/status' do
	if play_board.winner?(players.current_player) == true
		redirect to('/win')
	elsif play_board.board_full?() == true
		redirect to('/tie')
	end
	
	players.current = players.change()
	redirect to('/computerai') if players.type == "1" && players.current == 2
	erb :squares, :locals => {:p1 => players.player1, 
							  :p2 => players.player2, 
							  :invaild => "", 
							  :message2 => "", 
							  :current => players.current, 
							  :board => play_board.board, 
							  :type => players.type}	
end

get '/win' do
	erb :gameover, :locals => {:message => "Player #{players.current} wins!!! & Player #{players.change()} Sucks", 
							   :board => play_board.board}
end

get '/tie' do
	erb :gameover, :locals => {:message => "Player #{players.current} & Player #{players.change()} TIE ..... Boooo You both suck", 
							   :board => play_board.board}
end

post '/new' do
	play_board = Gameboard.new()
	players = Gameplayers.new()
	ai_initi = false
		redirect to('/tictactoe')
end


