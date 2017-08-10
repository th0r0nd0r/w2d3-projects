require 'hand'

class Player
  BET_OPTIONS = ["fold", "see", "raise"]
  attr_reader :name, :cash, :hand
  def initialize(name, cash)
    @name = name
    @cash = cash
    @hand = Hand.new
  end

  def check_monies(bet)
    raise InsufficientFundsError.new "You broke!" if bet > @cash
  end


end

class HumanPlayer < Player
  def get_bet
    puts "You wanna fold, see, or raise?"
    input = gets.chomp
    raise InvalidInputError.new "invalid input" unless BET_OPTIONS.include?(input)
  end
end

class ComputerPlayer < Player
  def get_bet
    return "see"
  end
end

class InvalidInputError < StandardError
end

class InsufficientFundsError < StandardError
end
