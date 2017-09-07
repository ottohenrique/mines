require './pretty_printer'
require './basic_printer'
require './game'


print "Deseja jogar com cores? (Y/n) > "
colors = STDIN.gets.chomp.downcase

print "Linhas (5) > "
rows = STDIN.gets.chomp
rows = rows.empty? ? 5 : rows.to_i

print "Colunas (8) > "
cols = STDIN.gets.chomp
cols = cols.empty? ? 8 : cols.to_i

print "Bombas (15) > "
bombs = STDIN.gets.chomp
bombs = bombs.empty? ? 8 : bombs.to_i


if colors == 'n'
  @printer = BasicPrinter
else
  @printer = PrettyPrinter
end

mines = Game.new(rows, cols, bombs)

begin
  while true
    @printer.new(mines.board_state).print

    print "flag (y/N) > "
    f = STDIN.gets.chomp.downcase

    print "x > "
    x = STDIN.gets.to_i

    print "y > "
    y = STDIN.gets.to_i

    valid = if f == 'y'
              mines.flag(x, y)
            else
              mines.play(x, y)
            end

    
    puts "Jogada inválida, jogar novamente" unless valid
  end
rescue => e
  @printer.new(mines.board_state).print
  puts e
end
