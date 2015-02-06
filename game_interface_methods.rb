# interface methods

def splash_screen
  system("clear")
  puts "W-W-W-W-W-Welcome!"
  puts "To the game!"
end

def get_player_names
  print "What do they call you, player one? "
  name = gets.chomp.capitalize
  @player_one_name = name unless name == ''
  print "And player two, how will you be known? "
  name = gets.chomp.capitalize
  @player_two_name = name unless name == ''
end

def ask_play_again
  print "Would you like to play a game? (y/n) "
  response = gets.chomp.downcase
  if response == 'y' || response == 'yes'
    return true
  else
    return false
  end
end

def ask_question(question)
  print "#{@current_player}, Answer the folowing: #{question} = ? ".blue
  answer = gets.chomp.to_i
  return answer
end

def wrong_answer_message
  puts "You are horribly wrong #{@current_player}".red
end

def right_answer_message
  puts "Correct!".green
end

def display_lives
  puts "#{@player_one_name}, you have #{@player_one_lives} lives left, #{@player_two_name}, you have #{@player_two_lives}".red
end

def end_game_message
  puts "Sorry #{@current_player}, you lose. you must work harder on your basic adition skills!"
end