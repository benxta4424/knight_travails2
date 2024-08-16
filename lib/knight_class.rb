class Knight

    KNIGHT_MOVES = [[1, 2], [-1, 2], [1, -2], [-1, -2], [2, 1], [-2, 1], [2, -1], [-2, -1]]

    def initialize
        @board=Array.new(8){Array.new(8,0)}
        @queue=[]
        @get_x=nil
        @get_y=nil
        @parent_array=[]
        @all_moves=[]
    end

    def print_board
        @board.each do |items|
            print items
            puts
        end
    end

    def get_values
        print 'x:'
        @get_x=gets.chomp.to_i
        puts 
        print 'y:'
        @get_y=gets.chomp.to_i
    end

    def get_shortest_path
        @queue<<[@get_x,@get_y,0]
        @board[@get_x][@get_y]=1
        switch=false
        while @queue
            current_array=@queue.shift

            cur_x=current_array[0]
            cur_y=current_array[1]
            distance=current_array[2]

            if cur_x==7 && cur_y==7
                puts "Ai gasit pozitia in #{distance} miscari"
                puts "Calea este:#{@parent_array}"
                switch=true
                break
            end

            KNIGHT_MOVES.each do |moves|
                knight_x=moves[0]+cur_x
                knight_y=moves[1]+cur_y

                if  knight_x.between?(0,7) && knight_y.between?(0,7) && @board[knight_x][knight_y]==0
                    @board[knight_x][knight_y]=1
                    @queue<<[knight_x,knight_y,distance+1]
                    @all_moves<<[knight_x,knight_y]
                else
                    next
                end
            end

            if switch
                break
            end

        end

        
        p @all_moves
        print_board
    end
    
end