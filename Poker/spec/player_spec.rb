require 'rspec'
require 'player'

describe "Player" do
  subject(:player) {Player.new("Tony", 100)}
  describe "#initialize" do
    it "takes and returns player name" do
      expect(player.name).to eq("Tony")
    end
    it "creates an empty hand" do
      expect(player.hand).to be_empty
    end
    it "stores player money" do
      expect(player.cash).to eq(100)
    end
  end
end
