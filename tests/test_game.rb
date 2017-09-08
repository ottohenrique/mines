require 'minitest/autorun'
require './game'

describe Game do
  describe 'Basic empty game board, without bombs' do
    before do
      @game = Game.new(3, 3, 0)
    end

    it 'generates a 3x3 matrix board' do
      row = ['.', '.', '.']
      empty_board = [row, row, row]

      assert_equal empty_board, @game.board_state
    end
  end

  describe 'siblings cells' do
    it 'siblings ignoring borders' do
      game = Game.new(1, 2, 0)
      
      assert_equal [[0, 1]], game.siblings(0, 0)
      assert_equal [[0, 0]], game.siblings(0, 1)

      game = Game.new(2, 1, 0)
      
      assert_equal [[1, 0]], game.siblings(0, 0)
      assert_equal [[0, 0]], game.siblings(1, 0)
    end

    it 'siblings from a cell away from border' do
      game = Game.new(3, 3, 0)
      siblings = [[0, 0], [0, 1], [0, 2], [1, 0], [1, 2], [2, 0], [2, 1], [2, 2]]

      assert_equal siblings, game.siblings(1, 1)
    end
  end

  describe 'flagging a cell' do
    before do
      @game = Game.new(1, 1, 0)
    end

    it 'marks and unmarks closed cell with flag' do
      assert_equal true, @game.flag(0, 0)
      assert_equal [['?']], @game.board_state

      assert_equal true, @game.flag(0, 0)
    end

    it 'cant mark a open cell with flag' do
      @game.play(0, 0)

      assert_equal false, @game.flag(0, 0)
    end

    it 'cant flag a invalid cell' do
      assert_equal false, @game.flag(10, 10)
    end
  end
end
