class HumanPlayer 
    attr_reader :mark
    def initialize(mark_value)
        @mark=mark_value
    end

    def get_position(legal_positions)
        p "Player #{mark}, enter two numbers representing a position in the format `row col`"
        input = gets.chomp.split(" ")
        if input.any? {|ele| ("a".."z").to_a.include?(ele)}
            raise "That is not a number"
        elsif input.length !=2
            raise "Invalid number of arguments! Please enter two arguments!"
        end
        pos=input.map(&:to_i)
        if legal_positions.include?(pos)
            pos
        else
            p "#{pos} is not correct. Please try another"
            get_position(legal_positions)
        end
    end
end