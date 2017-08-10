require_relative 'card.rb'
require 'byebug'

class Hand

  attr_accessor :cards
  attr_reader :type

  def initialize
    @cards = []
    @type = nil
  end

  def add_card(card)
    @cards << card
    @type = get_type if @cards.count == 5
  end

  def get_type
    return "royal flush" if royal_flush?
    return "straight flush" if straight_flush?
    return "four of a kind" if four_of_a_kind?
    return "full house" if full_house?
    return "flush" if flush?
    return "straight" if straight?
    return "three of a kind" if three_of_a_kind?
    return "two pair" if two_pair?
    return "one pair" if one_pair?
    return "high card"
  end

  def royal_flush?
    card_values = get_values
    card_values == [1,10,11,12,13] && @cards.all? { |card| card.suit == @cards[0].suit }
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    counts = card_counts
    counts.include?(4)
  end

  def full_house?
    counts = card_counts
    counts.include?(3) && counts.include?(2)
  end

  def flush?
    @cards.all? { |card| card.suit == @cards[0].suit }
  end

  def straight?
    card_values = get_values
    card_values[0...-1].each_with_index do |card, idx|
      return false if card + 1 != card_values[idx + 1]
    end
    true
  end

  def three_of_a_kind?
    counts = card_counts
    counts.include?(3) && !counts.include?(2)
  end

  def two_pair?
    counts = card_counts
    counts.count(2)==2
  end

  def one_pair?
    counts = card_counts
    counts.count(2)==1
  end

  def high_card
    get_values.last
  end

  def get_values
    card_values = []
    @cards.each { |card| card_values << card.value }
    card_values.sort!
  end

  def card_counts
    counts = Hash.new(0)
    card_values = get_values
    card_values.each do |val|
      counts[val] += 1
    end
    counts.values
  end


end
