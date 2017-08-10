require 'rspec'
require 'game'

describe 'Game' do
  players = [
    HumanPlayer.new("Rich",2),
    Player.new("Paul",25),
    Player.new("Tony",200),
  ]
  subject(:game) { Game.new(players) }
  describe "#initialize" do
    it "keeps a list of players" do
      expect(game.players).to eq(players)
    end
    it "creates a deck" do
      expect(game.deck).to be_a(Deck)
    end
    it "sets the pot to zero" do
      expect(game.pot).to eq(0)
    end
    it "sets all players to active" do
      expect(game.active_players).to eq(players)
    end
    it "sets current player to player one" do
      expect(game.current_player.name).to eq("Rich")
    end
  end
  describe '#deal_cards' do
    it "gives 5 cards to each player" do
      game.deal_cards
      expect(players[0].hand.cards.count).to eq(5)
      expect(players[1].hand.cards.count).to eq(5)
      expect(players[2].hand.cards.count).to eq(5)
    end
  end
  describe "#take_turn" do
    it "asks the current player for bet" do
      # expect(players[0]).to receive(:get_bet).and_return("see")
      # game.take_turn
    end
    it "removes current player from active players if bet is fold" do
      # allow(players[0]).to receive(:get_bet).and_return("fold")
      # expect(game.active_players).to_not include(players[0])
    end
    it "checks player's pot for available cash if raise or see"
    it "takes bet amount from player and puts it into pot"
  end
end
