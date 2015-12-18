require 'sinatra'
enable :sessions
require_relative "ai.rb"
require_relative"gameplayers.rb"
require_relative"gameboard.rb"

ai = Random.new()
players = Gameplayers.new()
get '/tictactoe' do
	
	erb :OneplayerorTwoplayer, :locals => {:message => "", :board => ""}
end

post '/tictactoe' do

gameplayers = Gameplayers.new
	players.type = params[:gametype]
	if players.type == "1"
		erb :howhard, :locals => {:message => "You Chose to play a 1 player game", :board => ""}
	else
		erb :marker, :locals => {:message => "You Chose to play a 2 player game", :board => ""}
	end
end

# sessions so that we can use it later on in the posts as well 

get '/marker' do
	session[:difficulty] = params[:difficulty] 
		if session[:difficulty] == "easy"
			erb :marker, :locals => {:message => "Really your gonna play EASY?", :board => ""}
		elsif session[:difficulty] == "medium"
			erb :marker, :locals => {:message => "Really your gonna play MEDIUM cool but how about hard?", :board => ""}
		else session[:difficulty] == "negamax"
			erb :marker, :locals => {:message => "Really your gonna play HARD? You know it can't be beat right?", :board => ""}

		end
end

post '/squares' do
	ai.players.player1 = params[:XorO]
	ai.players.player2 = ai.players.p2()

		erb :squares, :locals => {:player1 => ai.players.player1, :player2 => ai.players.player2, 
							  :message => "Player 1 is #{ai.players.player1} so Player 2 is #{ai.players.player2} ", :message2 => "You AI is a #{session[:difficulty]} level", 
							  :current => ai.players.current, :board => "", :type => ai.players.type, :invaild => ""}
end

post '/game' do
	choice = params[:choice].to_i
	player_marker = ai.players.current_player()
	
	if ai.play_board.square_available?(choice - 1) == true
		ai.play_board.board[choice - 1] = player_marker
		redirect to('/status')
	else
		erb :squares, :locals => {:player1 => ai.players.player1, :player2 => ai.players.player2, 
								  :invaild => "Hey man #{choice} is already taken", :error2 => "Please choose again.",:message => "",:message2 => "", 
								  :current => ai.players.current, :board => ai.play_board.board, :type => ai.players.type}
	end	
end

# i believe this is where we will have to do our if else either that or make a get for each difficulty level i think for the cpu and the status ones man 


get '/cpu' do
	player_marker = ai.players.current_player()
	move = ai.computer_move(ai.level)
	ai.play_board.board[move] = player_marker
	redirect to('/status')
end

get '/status' do
	if ai.play_board.winner?(ai.players.current_player) == true
		redirect to('/win')
	elsif ai.play_board.board_full?() == true
		redirect to('/tie')
	end
# where is the "1" in ai.players.type coming from? i think this is where start 	our if else to pick our level class 
ai.players.current = ai.players.change()
	redirect to('/cpu') if session[:difficulty] == "easy" && ai.players.current == 2
	erb :squares, :locals => {:player1 => ai.players.player1, :player2 => ai.players.player2, 
							  :invaild => "", :message => "", :message2 => "", 
							  :current => ai.players.current, :board => ai.play_board.board, :type => ai.players.type}	
end

get '/win' do
	erb :gameover, :locals => {:message => "!!! Hey player #{ai.players.current} you win!!!", :board => ai.play_board.board}
end

get '/tie' do
	erb :gameover, :locals => {:message => "It's a tie.", :board => ai.play_board.board}
end

post '/new' do
	ai = Random.new()
	
	redirect to('/tictactoe')
end