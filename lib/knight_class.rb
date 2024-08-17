class Knight

    KNIGHT_MOVES = [[1, 2], [-1, 2], [1, -2], [-1, -2], [2, 1], [-2, 1], [2, -1], [-2, -1]]

    def initialize
        @board=Array.new(8){Array.new(8,0)}
        @queue=[]
        @get_x=nil
        @get_y=nil
        @hash=Hash.new{ |hash,key| hash[key]=[] }
        @depth=nil
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

    def create_hash(value,x,y)
        @hash[value]<<[x,y]
    end

    def get_shortest_path
        
        depth=0

        @queue<<[@get_x,@get_y,0]
        @board[@get_x][@get_y]=1

        create_hash(depth,@get_x,@get_y)

        switch=false

        while !@queue.empty?

            depth+=1

            current_depth=@queue.size

            current_depth.times do

                cur_x,cur_y,cur_dist=@queue.shift

                KNIGHT_MOVES.each do |moves|
                    knight_x=moves[0]+cur_x
                    knight_y=moves[1]+cur_y

                    if knight_x.between?(0,7) && knight_y.between?(0,7) && @board[knight_x][knight_y]==0
                        @hash[depth]<<[knight_x,knight_y]
                        @board[knight_x][knight_y]=1
                        @queue<<[knight_x,knight_y]
                    else
                        next
                    end

                    if knight_x==7 && knight_y==7
                        switch=true
                        break
                    end

                end

            end

            if switch
                break
            end

        end
        @depth=depth
    end

    def distance_to_target
        @depth
    end

    def print_by_depth
        @hash.each_key do |key|
            print "depth #{key}: "
            print @hash[key]
            puts
            puts
            puts

        end
    end
    
end