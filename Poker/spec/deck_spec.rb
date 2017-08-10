require 'rspec'
require 'deck'

describe 'Deck' do
  subject(:deck) { Deck.new }
  describe '#initialize' do
    it "creates 52 cards" do
      expect(deck.cards.count).to eq(52)
    end
    it "creates 13 cards of each suit" do
      expect(deck.cards.find_all { |card| card.suit == :hearts }.count).to eq(13)
    end
    it "creates 4 suits" do
      expect(deck.cards.find_all { |card| card.value == 3 }.count).to eq(4)
    end
  end

  describe '#shuffle!' do
    it "randomly shuffles cards" do
      cards = deck.cards.dup
      shuffled = deck.shuffle!
      expect(shuffled).to_not eq(cards)
    end
  end
end
