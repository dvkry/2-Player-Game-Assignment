class Game


  def play(player_1, player_2, interface)

    @current_player = player_1
    @next_player = player_2
    question = Question.new

    until (player_1.lives == 0) || (player_2.lives == 0)

      interface.show_game_status(@current_player, @next_player)

      # generate a question
      if @current_player.points >= 10 # If the player has more than 10 point, we make the questions harder
        question.difficult_new_question
      else
        question.new_question 
      end

      # ask the question
      if question.ask(@current_player, interface)
        interface.correct(@current_player)
        @current_player.points += 1
      else
        interface.incorrect(@current_player)
        @current_player.lives -= 1
      end
      
      # switch players
      @current_player, @next_player = @next_player, @current_player

      if (@current_player.lives == 0) || (@next_player.lives == 0)
        begin
        raise OutOfLivesException 
      rescue OutOfLivesException => e
        puts "OutOfLivesException #{e}, Game Over"
        end
      
      end
    end

    interface.game_over(@current_player, @next_player) # We know that players were just switched, therefor @current_player must have won
  end
end

class Question

  attr_reader :question_str, :expected_answer

  def initialize
    new_question
  end

  def new_question
    x = 1 + rand(20)
    y = 1 + rand(20)
    @expected_answer = x + y
    @question_str = x.to_s + ' + ' + y.to_s
  end

  def difficult_new_question
    x = 1 + rand(20)
    y = 1 + rand(20)
    operator = 1 + rand(3)
    case operator
    when 1 # addition
      @expected_answer = x + y
      @question_str = x.to_s + ' + ' + y.to_s
    when 2 # subtraction with negative answers
      @expected_answer = x - y
      @question_str = x.to_s + ' - ' + y.to_s
    when 3 # multiplication
      @expected_answer = x * y
      @question_str = x.to_s + ' * ' + y.to_s
    end
  end

  def ask(current_player, interface)
    if @expected_answer == interface.ask_user("Answer the folowing: #{@question_str} = ? ").to_i
      return true
    else
      begin
        raise IncorrectGuessException
      rescue IncorrectGuessException => e
        puts "Wrong, so wrong you got an #{e.message}" 
      end
      return false
    end
  end
end

class OutOfLivesException < StandardError

end
class IncorrectGuessException < StandardError

end