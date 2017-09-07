class Mines
  attr_accessor :rows, :cols

  def initialize(rows, cols, mines)
    @board = Array.new(rows) { Array.new(cols) }
    @state = Array.new(rows) { Array.new(cols) { '.' }}

    @rows = rows
    @cols = cols

    fill_bombs(mines)
    fill_numbers
  end

  def board_state
    @state
  end

  def play(x, y)
    return false if @state[x][y] != '.'

    if @board[x][y] != 'x'
      @state[x][y] = @board[x][y]

      if @board[x][y] == ' '
        neighbors(x, y).each do |neigh|
          play(neigh[0], neigh[1])
        end
      end
    else
      raise 'Booooom!'
    end

    true
  end

  def fill_bombs(mines)
    while mines > 0
      x = rand(@rows)
      y = rand(@cols)

      if @board[x][y].nil?
        @board[x][y] = 'x'
        mines -= 1
      end
    end
  end

  def fill_numbers
    @board.each_with_index do |row, x|
      row.each_with_index do |col, y|
        if @board[x][y] != 'x'
          bombs = 0
          neighbors(x, y).each do |neigh|
            bombs += 1 if @board[neigh[0]][neigh[1]] == 'x'
          end
          @board[x][y] = bombs > 0 ? bombs : ' '
        end
      end
    end
  end

  def neighbors(x,y)
    n = []

    [-1, 0, 1].each do |i|
      [-1, 0, 1].each do |j|
        unless (i == 0 && j == 0) ||
            (x + i < 0 || x + i >= @rows) ||
            (y + j < 0 || y + j >= @cols)
          n << [x + i, y+j]
        end
      end
    end

    n
  end
end


def print_game(mines)
  mines.board_state.each_with_index do |row, i|
    if i == 0
      puts "    #{(0..row.size-1).to_a.join('   ')}"
    end
    puts "#{i} [ #{row.join(' | ')} ]"
  end
end

mines = Mines.new(5, 8, 5)

while true
  print_game(mines)

  print "x > "
  x = STDIN.gets.to_i

  print "y > "
  y = STDIN.gets.to_i

  mines.play(x, y)
end
