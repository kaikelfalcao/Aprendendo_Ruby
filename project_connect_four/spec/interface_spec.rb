# frozen_string_literal: true

require_relative '../lib/interface'
require_relative '../lib/grid'

describe Interface do
  let(:grid) { Grid.new(6, 7) }
  let(:player_name) { 'Alice' }

  describe '.display_grid' do
    it 'displays the grid content' do
      expect { Interface.display_grid(grid) }.to output.to_stdout
    end
  end

  describe '.get_column_choice' do
    it 'prompts the player for a column choice' do
      allow(STDIN).to receive(:gets).and_return("3\n")
      expect { Interface.get_column_choice(player_name) }.to output.to_stdout
    end
  end

  describe '.display_winner' do
    it 'displays the winner message' do
      expect { Interface.display_winner(player_name) }.to output.to_stdout
    end
  end

  describe '.display_tie_game' do
    it 'displays the tie game message' do
      expect { Interface.display_tie_game }.to output.to_stdout
    end
  end
end