require './pretty_printer'
require './basic_printer'
require './game'

def prompt(msg, d = '')
  print msg
  i = STDIN.gets.chomp.downcase
  i.empty? ? d : i
end

def iprompt(msg, d = '')
  prompt(msg, d).to_i
end

HELP = <<-HELP
  p: jogar
  f: colocar bandeira
  s: placar
  q: sair
  ?: ajuda (esse comando)
HELP


colors = prompt('Deseja jogar com cores? (Y/n) > ', 'y')
if colors == 'n'
  @printer = BasicPrinter
else
  @printer = PrettyPrinter
end

rows = iprompt('Linhas (5) > ', 5)
cols = iprompt('Colunas (8) > ', 8)
bombs = iprompt('Bombas (15) > ', 15)

mines = Game.new(rows, cols, bombs)

puts HELP

begin
  while !mines.victory?
    @printer.new(mines.board_state).print

    c = prompt('comando (P/f/s/q/?) > ', 'p')

    case c
    when 'p', 'f'
      x = iprompt('x > ')
      y = iprompt('y > ')

      valid = if c == 'p'
                mines.play(x, y)
              else
                mines.flag(x, y)
              end

      puts "Jogada inválida, jogar novamente" unless valid
    when 's'
      puts "> bandeiras: #{mines.flags}"
      puts "> abertas:   #{mines.open_cells}"
      puts "> fechadas:  #{mines.total_cells - mines.open_cells}"
    when 'q'
      exit(1)
    when '?'
      puts HELP
    else
      puts "#{x}: Comando inválido"
    end
  end

  puts ""
  puts "Parabéns!! você encontrou todas as bombas!"
  puts ""

  @printer.new(mines.board_state).print

rescue => e
  @printer.new(mines.board_state).print
  puts e
end
