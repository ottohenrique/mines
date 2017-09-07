class BasicPrinter
  def initialize(game_state)
    @state = game_state
  end

  def print
    @state.each_with_index do |row, i|
      if i == 0
        puts "    #{(0..row.size-1).to_a.join('   ')}"
      end
      puts "#{i} [ #{row.join(' | ')} ]"
    end
  end
end
