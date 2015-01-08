require 'game.rb'

describe Game do

  let (:game) {Game.new}
  let (:player1) {double :player, countries: belgium}
  let (:player2) {double :player, countries: brazil}
  let (:belgium) {double :country, armies: 3}
  let (:brazil) {double :country, armies: 2, attacked?: true}
 
  context "The basics" do

    it "can have a player added" do
      game.add_player(player1)
      expect(game.player1).to eq player1
    end

    it "can have a second player added" do
    	game.add_player(player1)
    	game.add_player(player2)
    	expect(game.player2).to eq player2
    end

    it "knows there are two players" do
      game.send(:add_player, player1)
      game.send(:add_player, player2)
      expect(game.send(:has_two_players?)).to eq true
    end

    it "knows there aren't two players" do
      game.send(:add_player, player1)
      expect(game.send(:has_two_players?)).to eq false
    end

    it "knows who's turn it is" do
      game.add_player(player1)
      expect(game.send(:turn)).to eq(player1)
    end

    it "player has a country and the country has an army" do
    	expect(player1.countries).to eq belgium
    	expect(player1.countries.armies).to eq 3
    end

  end

  context "Attacking" do

  	before do
  		game.add_player(player1)
    	game.add_player(player2)
    end

      it "should generate error if attacker only has one army" do

      end

	  	it "attacking country with more armies removes army from defender" do
        attack({:attacking_player => player1, 
                :defending_player => player2,
                :attacking_country => belgium,
                :defending_country => brazil
                })
       
        expect(brazil).to have_recieved(:remove_army)       
	  	end

      it "attacking country takes over country with single defending army" do

      end

  end
end







