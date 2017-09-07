class PrettyPrinter
  def initialize(game_state)
    @state = game_state.map do |row|
               row.map do |col|
                 case col
                   when '.'
                     colorize(36, '.')
                   when '?'
                     colorize(33, '?')
                   when 'X'
                     colorize(31, 'X')
                   else
                     col
                 end
               end
             end
  end

  def print
    @state.each_with_index do |row, i|
      if i == 0
        puts "    #{(0..row.size-1).to_a.join('   ')}"
      end
      puts "#{i} [ #{row.join(' | ')} ]"
    end
  end

  def colorize(mode, v)
    "\e[#{mode}m#{v}\e[0m"
  end
end
