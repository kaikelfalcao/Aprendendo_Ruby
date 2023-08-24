# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  describe '#initialize' do
    it 'creates a player with the given name and symbol' do
      player = Player.new('Luisa', 'X')
      expect(player.name).to eq('Luisa')
      expect(player.symbol).to eq('X')
    end
  end
end