require 'rspec'
require 'card'

describe 'Card' do
  subject(:card) { Card.new(5,:hearts) }
  describe '#initialize' do
    it "takes and sets a value" do
      expect(card.value).to eq(5)
    end
    it "takes and sets a suit" do
      expect(card.suit).to eq(:hearts)
    end
    it "creates a symbol" do
      expect(card.symbol).to eq("5")
    end
  end
end
