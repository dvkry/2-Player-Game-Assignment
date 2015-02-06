# game methods and heavy lifting
require './game_interface_methods.rb'

def change_player
  if @current_player == @player_one_name
    @current_player = @player_two_name
  else
    @current_player = @player_one_name
  end
end

def generate_question
  x = 1 + rand(20)
  y = 2 + rand(20)
  question_string = x.to_s + ' + ' + y.to_s
  answer = ask_question(question_string)
  if answer == x + y
    return true
  else
    return false
  end
end

def player_is_correct
  # todo correct message
  right_answer_message
end

def player_is_incorrect
  if @current_player == @player_one_name
    @player_one_lives -= 1
  else
    @player_two_lives -= 1
  end
  wrong_answer_message
  display_lives
end

def play_one_turn
  if generate_question
    player_is_correct
  else
    player_is_incorrect
  end
end

def play_one_game
  @player_one_lives = 3
  @player_two_lives = 3
  @current_player = @player_one_name

  until @player_one_lives == 0 || @player_two_lives == 0
    play_one_turn
    change_player
  end
  end_game_message
end