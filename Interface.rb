# user interaction:

class SplashScreen

  def scroll(lines)
    lines.times do
      puts ''
      sleep(0.03)
    end
  end

  def display
    system('clear') # clear the screen
    80.times { puts '' } # move to the bottom of the screen

    puts "W-W-W-W-WELCOME".center(80).green
    scroll(6)
    puts "T-T-T-T-TO".center(80).red
    scroll(6)
    puts "T-T-T-T-The".center(80).yellow
    scroll(6)
    puts "G-G-G-G-GAME!!".center(80).blue
    scroll(6)
  end
end

# interface class is very simple, it's existance will allow for future expansion
class Interface

  def print_out(string)
    print string
  end

  # ask_user returns a string
  def ask_user(string)
    print string
    gets.chomp
  end

  # ask_user_bool returns true if the user types 'y' or 'yes' case insensitive, false otherwise
  def ask_user_bool(string)
    print string
    response = gets.chomp.downcase
    if response == 'y' || response == 'yes'
      return true
    else
      return false
    end
  end

  def correct(player)
    puts ''
    puts "#{player.name}, you are correct!".green
    puts ''
  end

  def incorrect(player)
    puts ''
    puts "Wrong #{player.name}!".red
    puts ''
  end

  def show_game_status(current_player, next_player)
    puts "#{current_player.name}: " + "#{current_player.points}".blue + " points."
    puts "#{next_player.name}: " + "#{next_player.points}".blue + " points."
    puts "\n" + "It's " + "#{current_player.name}".bold + "'s' turn, you have " + "#{current_player.lives}".blue + " lives left #{next_player.name} has " + "#{next_player.lives}".blue + "."
  end

  def game_begin(player_1, player_2)
    puts "\n\n" + "Great! get ready!".bold + "\n\n\n"
  end

  def game_over(winner, loser)
    puts "Game Over!".red.bold + "\n\n"
    puts "#{winner.name}".magenta.bold + " has won with " + "#{winner.points}".blue + " points! Sorry " + "#{loser.name}".red + ", try again." + "\n\n"
  end
end