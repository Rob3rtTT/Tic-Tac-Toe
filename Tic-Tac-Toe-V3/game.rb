require_relative "./board.rb"
require_relative "./human_player.rb"
require_relative "./computer_player.rb"

class Game
    def initialize(players)
        @players = players.map do |mark, is_computer|
            if is_computer == true
                ComputerPlayer.new(mark)
            else
                HumanPlayer.new(mark)
            end
        end
        @current_player=@players.first
        @board = Board.new
    end

    def switch_turn 
        @current_player = @players.rotate!.first
    end

    def play
        while @board.empty_positions?
            @board.print
            choices=@board.legal_positions
            pos = @current_player.get_position(choices)
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                victory= "Victory, #{@current_player.mark.to_s} has won the game"
                return victory
            else
                switch_turn
            end
        end
        p "Draw!"
    end

end