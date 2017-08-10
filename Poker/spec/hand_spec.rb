require 'rspec'
require 'hand'

describe 'Hand' do
  subject(:hand) { Hand.new }
  describe '#initialize' do
    it "creates an empty hand" do
      expect(hand.cards).to be_empty
    end
  end
  let(:card) { double("Card", value: 3) }

  describe '#add_card' do
    it "adds card to your hand" do
      hand.add_card(card)
      expect(hand.cards.count).to eq(1)
      expect(hand.cards[0].value).to eq(3)
    end
    it "sets the hand type if hand is full" do
      hand.cards = [
        Card.new(10, :spades),
        Card.new(11, :spades),
        Card.new(12, :spades),
        Card.new(13, :spades)
      ]
      hand.add_card(Card.new(1, :spades))
      expect(hand.type).to eq("royal flush")
    end
  end

  describe "#royal_flush?" do
    it "returns true if hand is royal flush" do
      hand.cards = [
        Card.new(10, :spades),
        Card.new(11, :spades),
        Card.new(12, :spades),
        Card.new(13, :spades),
        Card.new(1, :spades)
      ]
      expect(hand.royal_flush?).to be true
    end
    it "returns false if hand is not royal flush" do
      hand.cards = [
        Card.new(10, :hearts),
        Card.new(11, :spades),
        Card.new(7, :spades),
        Card.new(13, :clubs),
        Card.new(1, :spades)
      ]
      expect(hand.royal_flush?).to be false
    end
  end

  describe "#straight_flush?" do
    it "returns true if hand is straight flush" do
      hand.cards = [
        Card.new(6, :spades),
        Card.new(5, :spades),
        Card.new(4, :spades),
        Card.new(3, :spades),
        Card.new(7, :spades)
      ]
      expect(hand.straight_flush?).to be true
    end
    it "returns false if hand is not straight flush" do
      hand.cards = [
        Card.new(10, :hearts),
        Card.new(11, :spades),
        Card.new(7, :spades),
        Card.new(13, :clubs),
        Card.new(1, :spades)
      ]
      expect(hand.straight_flush?).to be false
    end
  end

  describe "#four_of_a_kind?" do
    it "returns true if hand is four of a kind" do
      hand.cards = [
        Card.new(6, :spades),
        Card.new(5, :hearts),
        Card.new(5, :clubs),
        Card.new(5, :diamonds),
        Card.new(5, :spades)
      ]
      expect(hand.four_of_a_kind?).to be true
    end
    it "returns false if hand is not four of a kind" do
      hand.cards = [
        Card.new(10, :hearts),
        Card.new(11, :spades),
        Card.new(7, :spades),
        Card.new(13, :clubs),
        Card.new(1, :spades)
      ]
      expect(hand.four_of_a_kind?).to be false
    end
  end

  describe "#full_house?" do
    it "returns true if hand is a full house" do
      hand.cards = [
        Card.new(6, :spades),
        Card.new(5, :hearts),
        Card.new(5, :clubs),
        Card.new(6, :diamonds),
        Card.new(5, :spades)
      ]
      expect(hand.full_house?).to be true
    end
    it "returns false if hand is not a full house" do
      hand.cards = [
        Card.new(10, :hearts),
        Card.new(11, :spades),
        Card.new(7, :spades),
        Card.new(13, :clubs),
        Card.new(1, :spades)
      ]
      expect(hand.full_house?).to be false
    end
  end

  describe "#flush?" do
    it "returns true if hand is a flush" do
      hand.cards = [
        Card.new(6, :spades),
        Card.new(5, :spades),
        Card.new(8, :spades),
        Card.new(2, :spades),
        Card.new(9, :spades)
      ]
      expect(hand.flush?).to be true
    end
    it "returns false if hand is not a flush" do
      hand.cards = [
        Card.new(10, :hearts),
        Card.new(11, :spades),
        Card.new(7, :spades),
        Card.new(13, :clubs),
        Card.new(1, :spades)
      ]
      expect(hand.flush?).to be false
    end
  end

  describe "#straight?" do
    it "returns true if hand is a straight" do
      hand.cards = [
        Card.new(6, :spades),
        Card.new(5, :hearts),
        Card.new(4, :clubs),
        Card.new(3, :hearts),
        Card.new(7, :spades)
      ]
      expect(hand.straight?).to be true
    end
    it "returns false if hand is not a straight" do
      hand.cards = [
        Card.new(10, :hearts),
        Card.new(11, :spades),
        Card.new(7, :spades),
        Card.new(13, :clubs),
        Card.new(1, :spades)
      ]
      expect(hand.straight?).to be false
    end
  end

  describe "#three_of_a_kind?" do
    it "returns true if hand is three of a kind" do
      hand.cards = [
        Card.new(6, :spades),
        Card.new(5, :hearts),
        Card.new(5, :clubs),
        Card.new(5, :diamonds),
        Card.new(9, :spades)
      ]
      expect(hand.three_of_a_kind?).to be true
    end
    it "returns false if hand is not three of a kind" do
      hand.cards = [
        Card.new(10, :hearts),
        Card.new(11, :spades),
        Card.new(7, :spades),
        Card.new(13, :clubs),
        Card.new(1, :spades)
      ]
      expect(hand.three_of_a_kind?).to be false
    end
  end

  describe "#two_pair?" do
    it "returns true if hand is two pair" do
      hand.cards = [
        Card.new(6, :spades),
        Card.new(5, :hearts),
        Card.new(6, :clubs),
        Card.new(5, :diamonds),
        Card.new(9, :spades)
      ]
      expect(hand.two_pair?).to be true
    end
    it "returns false if hand is not two pair" do
      hand.cards = [
        Card.new(10, :hearts),
        Card.new(11, :spades),
        Card.new(7, :spades),
        Card.new(13, :clubs),
        Card.new(1, :spades)
      ]
      expect(hand.two_pair?).to be false
    end
  end

  describe "#one_pair?" do
    it "returns true if hand is a pair" do
      hand.cards = [
        Card.new(6, :spades),
        Card.new(8, :hearts),
        Card.new(6, :clubs),
        Card.new(5, :diamonds),
        Card.new(9, :spades)
      ]
      expect(hand.one_pair?).to be true
    end
    it "returns false if hand is not a pair" do
      hand.cards = [
        Card.new(10, :hearts),
        Card.new(11, :spades),
        Card.new(7, :spades),
        Card.new(13, :clubs),
        Card.new(1, :spades)
      ]
      expect(hand.one_pair?).to be false
    end
  end

  describe "#high_card" do
    it "returns high card value" do
      hand.cards = [
        Card.new(6, :spades),
        Card.new(8, :hearts),
        Card.new(6, :clubs),
        Card.new(5, :diamonds),
        Card.new(9, :spades)
      ]
      expect(hand.high_card).to eq(9)
    end
  end

  describe "#get_type" do
    it "returns correct hand type" do
      hand.cards = [
        Card.new(6, :spades),
        Card.new(5, :spades),
        Card.new(4, :spades),
        Card.new(3, :spades),
        Card.new(7, :spades)
      ]
      expect(hand.get_type).to eq("straight flush")

      hand.cards = [
        Card.new(6, :spades),
        Card.new(5, :hearts),
        Card.new(5, :clubs),
        Card.new(5, :diamonds),
        Card.new(9, :spades)
      ]
      expect(hand.get_type).to eq("three of a kind")

      hand.cards = [
        Card.new(6, :spades),
        Card.new(5, :hearts),
        Card.new(6, :clubs),
        Card.new(5, :diamonds),
        Card.new(9, :spades)
      ]
      expect(hand.get_type).to eq("two pair")

    end
  end

end
