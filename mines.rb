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

begin
  while true
    @printer.new(mines.board_state).print

    c = prompt('comando (P/f/s/q/?) > ', 'p')

    case c
    when 'p'
      x = iprompt('x > ')
      y = iprompt('y > ')
      valid = mines.play(x, y)
      
      puts "Jogada inválida, jogar novamente" unless valid
    when 'f'
      x = iprompt('x > ')
      y = iprompt('y > ')
      valid = mines.flag(x, y)
      
      puts "Jogada inválida, jogar novamente" unless valid
    when 's'
    when 'q'
      exit(1)
    when '?'
      puts <<-HELP
          p: jogar
          f: colocar bandeira
          s: placar
          q: sair
          ?: ajuda (esse comando)
        HELP
    else
      puts "#{x}: Comando inválido"
    end

  end
rescue => e
  @printer.new(mines.board_state).print
  puts e
end
