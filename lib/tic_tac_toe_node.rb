require_relative 'tic_tac_toe'
require 'byebug'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark 
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []
    (0...3).each do |row_idx|
      (0...3).each do |col_idx|
        if board.empty?([row_idx, col_idx])
          new_board = board.dup
          pos = [row_idx,col_idx]
          new_board[pos] = next_mover_mark
          new_mover_mark = next_mover_mark == :x ? :o : :x
          children << TicTacToeNode.new(new_board, new_mover_mark, pos)
        end
      end
    end
    children
  end
end
