require 'deck'
require 'player'
class Game
  attr_reader :players, :deck, :active_players, :pot, :current_player
  def initialize(players)
    @players = players
    @deck = Deck.new
    @active_players = players
    @pot = 0
    @current_player = @players[0]
  end

  def deal_cards
    @players.each do |player|
      5.times do
        player.hand.add_card(deck.draw_card)
      end
    end
  end

  def take_turn
    begin
      bet = @current_player.get_bet
    rescue InvalidInputError
      retry
    end
    case bet
    when "fold"
      @active_players.delete(@current_player)
    when "see"
    # if @current_player.che

    when "raise"
  end

end
