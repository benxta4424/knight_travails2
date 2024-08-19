class Knight
  KNIGHT_MOVES = [[1, 2], [-1, 2], [1, -2], [-1, -2], [2, 1], [-2, 1], [2, -1], [-2, -1]]

  def initialize
    @board = Array.new(8) { Array.new(8, 0) }
    @queue = []
    @get_x = nil
    @get_y = nil
    @hash = Hash.new { |hash, key| hash[key] = [] }
    @depth = nil
    @path = []
  end

  def print_board
    @board.each do |items|
      print items
      puts
    end
  end

  def get_values
    print "x:"
    @get_x = gets.chomp.to_i
    puts
    print "y:"
    @get_y = gets.chomp.to_i
  end

  def create_hash(value, x, y)
    @hash[value] << [x, y]
  end

  def get_shortest_path
    depth = 0

    @queue << [@get_x, @get_y, 0]
    @board[@get_x][@get_y] = 1

    create_hash(depth, @get_x, @get_y)

    switch = false

    until @queue.empty?

      depth += 1

      current_depth = @queue.size

      current_depth.times do
        cur_x, cur_y, cur_dist = @queue.shift

        KNIGHT_MOVES.each do |moves|
          knight_x = moves[0] + cur_x
          knight_y = moves[1] + cur_y

          next unless knight_x.between?(0, 7) && knight_y.between?(0, 7) && @board[knight_x][knight_y] == 0

          @hash[depth] << [knight_x, knight_y]
          @board[knight_x][knight_y] = 1
          @queue << [knight_x, knight_y]

          if knight_x == 7 && knight_y == 7
            switch = true
            break
          end
        end
      end

      break if switch

    end
    @depth = depth
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

  def backtrack
    size = @depth
    cur_x = 7
    cur_y = 7
    @path << [cur_x, cur_y]

    while size > 0

      switch = false

      @hash[size].each do |sets|
        cur_x, cur_y = sets

        KNIGHT_MOVES.each do |items|
          knight_x = cur_x - items[0]
          knight_y = cur_y - items[1]

          puts knight_x, knight_y

          next unless @hash[size - 1].include?([knight_x, knight_y])

          @path << [knight_x, knight_y]
          switch = true
          break
        end

        break if switch
      end
      size -= 1
    end
  end

  def pathh
    p @path.reverse
  end
end
