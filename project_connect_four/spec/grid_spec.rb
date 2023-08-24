# frozen_string_literal: true
require_relative '../lib/grid'

describe Grid do
  let(:rows) { 6 }
  let(:cols) { 7 }
  let(:grid) { Grid.new(rows, cols) }

  describe '#initialize' do
    it 'creates a grid with the given number of rows and columns' do
      expect(grid.rows).to eq(rows)
      expect(grid.cols).to eq(cols)
    end
  end

  describe '#[]' do
    it 'returns the value at the specified row and column' do
      grid[2, 3] = 'X'
      expect(grid[2, 3]).to eq('X')
    end
  end

  describe '#[]=' do
    it 'sets the value at the specified row and column' do
      grid[1, 4] = 'O'
      expect(grid[1, 4]).to eq('O')
    end
  end
  describe '#display' do
    it 'displays the grid content' do
      expect { grid.display($stdout) }.to output.to_stdout
    end
  end
end