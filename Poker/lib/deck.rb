require_relative 'card.rb'

class Deck
  SUITS = [:spades, :hearts, :diamonds, :clubs]

  attr_reader :cards
  def initialize
    @cards = []
    SUITS.each do |suit|
      (1..13).each do |value|
        @cards << Card.new(value, suit)
      end
    end
    shuffle!
  end

  def shuffle!
    @cards.shuffle!
  end

  def draw_card
    @cards.shift
  end
end
