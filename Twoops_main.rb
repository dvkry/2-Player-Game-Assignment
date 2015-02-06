require_relative 'Player_class'
require_relative 'Game_classes'
require_relative 'Interface'
require 'colorize'


# Snazzy splash screen

splash = SplashScreen.new
splash.display

# get the player names
interface = Interface.new
player_1 = Player.new("Player 1")
player_2 = Player.new("Player 2")
player_1.get_name(interface, player_1)
player_2.get_name(interface, player_2)

if interface.ask_user_bool("So, #{player_1.name} and #{player_2.name} are you ready to play? ")
  interface.game_begin(player_1, player_2)
#  interface.print_out("Let's play")
  game = Game.new
  game.play(player_1, player_2, interface)

  until !interface.ask_user_bool("Would you like to play again? ")
    interface.game_begin(player_1, player_2)
#    interface.print_out("lets play again")
    player_1.reset
    player_2.reset

    game = Game.new
    game.play(player_1, player_2, interface)
  end
end