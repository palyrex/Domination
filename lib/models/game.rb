class Game

  require_relative "./country.rb"
  require_relative "./country_code_lookup.rb"

  attr_accessor :player1, :player2
  # attr_writer :turn

  def initialize
    player1, player2 = nil, nil
  end

  def show_player_countries(player, colour, countries_array)
    player.countries.each do |country| 
      country_hash = {}
      country_hash[:country] = COUNTRY_CODE_HASH[country.name]
      country_hash[:color] = colour
      countries_array << country_hash
    end
    return countries_array
  end

  def show_countries
    countries_array = []
    countries_array = show_player_countries(player1, 'red', countries_array)
    countries_array = show_player_countries(player2, 'blue', countries_array)
    return {:countries => countries_array}
  end 

  def assign_countries
    players = [player1, player2]
    COUNTRY_CODE_HASH.keys.each do |country_name|
      country = Country.new(country_name)
      players.shuffle.first.country_input(country)
    end
  end

  def add_player(player)
    self.player1 ? self.player2 = player : self.player1 = player unless has_two_players?
  end

  def attack(battle_setup_hash)
    if battle_setup_hash[:defending_country].armies == 1
      battle_setup_hash[:attacking_player].country_input(battle_setup_hash[:defending_country])
      battle_setup_hash[:defending_player].remove_country(battle_setup_hash[:defending_country])
      # battle_setup_hash[:attacking_country].remove_army
    else
      battle_setup_hash[:defending_country].remove_army
    end
  end

  private

  def has_two_players?
    !player2.nil?
  end
  
end
  # def opponent 
  #   current_player == player1 ? player2 : player1
  # end

  # def invaded(country)
  #   opponent.remove_army(country)
  # end

  # def turn 
  #   @turn ||= player1
  # end


  # alias :current_player :turn


  # def switch_turns
  #   turn == player1 ? self.turn = player2 : self.turn = player1
  # end
