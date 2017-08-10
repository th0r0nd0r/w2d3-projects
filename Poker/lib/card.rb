class Card
  SYMBOL_VALUE_PAIRS = {
    1 => "A",
    2 => "2",
    3 => "3",
    4 => "4",
    5 => "5",
    6 => "6",
    7 => "7",
    8 => "8",
    9 => "9",
    10 => "10",
    11 => "J",
    12 => "Q",
    13 => "K"
  }
  attr_reader :value, :suit, :symbol
  def initialize(value, suit)
    @value = value
    @suit = suit
    @symbol = SYMBOL_VALUE_PAIRS[value]
  end



end
