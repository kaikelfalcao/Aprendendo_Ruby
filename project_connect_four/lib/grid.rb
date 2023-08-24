# frozen_string_literal: true

class Grid
  attr_reader :rows, :cols

  def initialize(rows, cols)
    @rows = rows
    @cols = cols
    @grid = Array.new(rows) { Array.new(cols, ' ') }
  end

  def display(out_stream)
    out_stream.puts(" 0 1 2 3 4 5 6")
    out_stream.puts("---------------")
    (0..(rows - 1)).each do |row|
      out_stream.print("|")
      (0..(cols - 1)).each do |col|
        out_stream.print(@grid[row][col])
        out_stream.print("|")
      end
      out_stream.puts
      out_stream.puts("---------------")
    end
    out_stream.puts(" 0 1 2 3 4 5 6")
    out_stream.puts
  end

  def [](row, col)
    @grid[row][col]
  end

  def []=(row, col, value)
    @grid[row][col] = value
  end
end