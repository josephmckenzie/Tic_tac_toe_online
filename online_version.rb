require 'sinatra'
require_relative "TTTFunctions.rb"

#variable initializing a new instance of class TTTgame
#passing in board, player1, player2, and current_player. Player1 is by default.
game = TTTgame.new(@board, "", "", 1)


get '/tictactoe' do
	erb :Tictactoe_board1, :locals => {:board => game.board,:message => "Let's play some tic tac toe!", :message2 => "Wanna Pick X or O ?", :message3 => "", :message4 => ""}

end


post '/tictactoe' do
  game.player1 = params[:selection].upcase
  
	if game.marker_valid?(game.player1) == true
		game.player2 = game.p2(game.player1)
		erb :Tictactoe_board2, :locals => {:current => game.current, :message => "Player 1 is #{game.player1} and Player 2 is #{game.player2}.", :board => game.board}
	end
end

post '/board' do
	choice = params[:choice].to_i
	player_marker = game.current_player()
	
	if game.square_valid?(choice, game.board) == true
		game.board[choice - 1] = player_marker
			
			if game.is_board_full?(game.board) == false && game.win(game.board) == false
				game.current = game.switch_players()
				erb :Tictactoe_board2, :locals => { :current => game.current, :message => "Player #{player_marker} has chosen square #{params[:choice]}.", :board => game.board }
			elsif game.win(game.board) == true
				erb :Tictactoe_board1, :locals => {:message => "", :message2 => "Wanna Pick X or O ?", :message3 => "!!Play again!!",:message4 => "Player #{player_marker} has won.", :board => game.board }
			else game.is_board_full?(game.board) == true
			erb :Tictactoe_board1, :locals => {:message => "", :message2 => "Wanna Pick X or O ?", :message3 => "",:message4 => "Players have tied.", :board => game.board }
			end
			else erb :Tictactoe_board2, :locals => { :current => game.current, :message => "Choice is already Taken Try again", :board => game.board }
		end
 end

post '/replay' do
	choice = params[:selection]
	game = TTTgame.new(@board, "", "", 1)
		if choice == "y"
			erb :Tictactoe_board1, :locals => {:board => game.board,:message => "Let's play some tic tac toe!", :message2 => "Wanna Pick X or O ?", :message3 => ""}
			
		else
			erb :Tictactoe_board1, :locals => {:board => game.board,:message => "To bad your gonna play over and over and over", :message2 => "!!!Pick X or O!!!", :message3 => "It will Never End!!!! HAHAHA"}
	
		end

 end