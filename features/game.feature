Feature: In order to play the game
As a player
I want to be able to control countries with armies

  Scenario: See several countries
  Given I have just started the game
  When I am on the homepage
  Then I can see some countries

  Scenario: See armies 
  Given I have just started the game
  Then I can see my armies
