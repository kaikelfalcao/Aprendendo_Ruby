# frozen_string_literal: true

require_relative '../lib/game'

describe Game do
  let(:player_1) { 'Luisa' }
  let(:player_1_symbol) { 'X' }
  let(:player_2) { 'Kaike' }
  let(:player_2_symbol) { 'O' }

  let(:game) { Game.new(player_1, player_1_symbol, player_2, player_2_symbol) }

  describe '#initialize' do
    it 'creates a game with the specified players and symbols' do
      expect(game.instance_variable_get(:@players)[0].name).to eq(player_1)
      expect(game.instance_variable_get(:@players)[1].name).to eq(player_2)
      expect(game.instance_variable_get(:@players)[0].symbol).to eq(player_1_symbol)
      expect(game.instance_variable_get(:@players)[1].symbol).to eq(player_2_symbol)
    end
  end

  describe '#validate_play' do
    it 'returns true for a valid column' do
      expect(game.send(:validate_play, 2)).to be_truthy
    end

    it 'returns false for an invalid column' do
      expect(game.send(:validate_play, 7)).to be_falsey
    end

    it 'returns false for a full column' do
      allow(game.instance_variable_get(:@grid)).to receive(:[]).and_return(player_1_symbol)
      expect(game.send(:validate_play, 3)).to be_falsey
    end
  end

  describe '#check_winner' do
    it 'returns true if a player wins horizontally' do
      4.times { |i| game.instance_variable_get(:@grid)[0, i] = player_1_symbol }
      expect(game.send(:check_winner)).to be_truthy
    end

    it 'returns true if a player wins vertically' do
      (0..3).each { |i| game.instance_variable_get(:@grid)[i, 0] = player_1_symbol }
      expect(game.send(:check_winner)).to be_truthy
    end

    it 'returns true if a player wins diagonally up' do
      (0..3).each { |i| game.instance_variable_get(:@grid)[3 - i, i] = player_1_symbol }
      expect(game.send(:check_winner)).to be_truthy
    end

    it 'returns true if a player wins diagonally down' do
      (0..3).each { |i| game.instance_variable_get(:@grid)[i, i] = player_1_symbol }
      expect(game.send(:check_winner)).to be_truthy
    end

    it 'returns false if there is no winner' do
      expect(game.send(:check_winner)).to be_falsey
    end
  end

end
