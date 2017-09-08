require './basic_printer'

class PrettyPrinter < BasicPrinter
  def initialize(board)
    super(board)
  end

  def board
    @board.map do |row|
      row.map do |col|
        case col
        when '.'
          colorize(36, '.')
        when '?'
          colorize(33, '?')
        when 'X'
          colorize(31, 'X')
        when (1..8)
          colorize(32, col)
        else
          col
        end
      end
    end
  end

  def colorize(mode, v)
    "\e[#{mode}m#{v}\e[0m"
  end
end
