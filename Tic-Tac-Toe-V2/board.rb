class Board 
    def initialize 
        p "Please enter the dimension of you grid:"
        input = gets.chomp.to_i
        @grid = Array.new(input){Array.new(input) {'_'}}
    end
    
    def [](position)
        row,col = position
        @grid[row][col]
    end

    def []=(position, val)
        row,col=position
        @grid[row][col]=val
    end

    def valid?(position)
        row,col=position
        position.all? do |i|
            0 <= i && i < @grid.length
        end
    end

    def empty?(position)
        self[position]=='_'
    end

    def place_mark(position, mark)
            if !empty?(position) || !valid?(position)
            raise 'Invalid position!'
        else
            self[position]=mark
        end
    end

    def print
        @grid.each do |row|
            puts row.join(' ')
        end
    end

    def win_row?(mark)
        @grid.any?{|row| row.all?(mark)}
    end

    def win_col?(mark)
        @grid.transpose.any?{|col| col.all?(mark)}
    end

    def win_diagonal?(mark)
        left_to_right = (0...@grid.length).all? do |i|
            pos = [i, i]
            self[pos]==mark
        end

        right_to_left = (0...@grid.length).all? do |i|
            row = i
            col = @grid.length - 1 - i
            pos = [row, col]
            self[pos]==mark
        end

        right_to_left || left_to_right
    end

    def win?(mark)
        win_row?(mark) || win_diagonal?(mark) || win_col?(mark)
    end

    def empty_positions?
        return true if @grid.flatten.any? {|pos| pos == '_'}
        false
    end 
end

