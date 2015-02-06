# main game loop

require 'colorize'

require './game_interface_methods.rb'
require './game_functionality.rb'


splash_screen

@player_one_name = 'Player_one'
@player_two_name = 'Player_two'
get_player_names

until !ask_play_again do
  play_one_game
end