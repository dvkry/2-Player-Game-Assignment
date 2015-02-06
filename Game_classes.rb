class Game

  def initialize()

  end

  def play(player_1, player_2, interface)

    @current_player = player_1
    @next_player = player_2
    question = Question.new

    until (player_1.lives == 0) || (player_2.lives == 0)

      interface.show_game_status(@current_player, @next_player)

      question.new_question

      if question.ask(@current_player, interface)
        interface.correct(@current_player)
        @current_player.points += 1
      else
        interface.incorrect(@current_player)
        @current_player.lives -= 1
      end

      @current_player, @next_player = @next_player, @current_player

    end

    interface.game_over(@current_player, @next_player) # We know that players were just switched, therefor @current_player must have won
    # end of game
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

  def ask(current_player, interface)
    if @expected_answer == interface.ask_user("Answer the folowing: #{@question_str} = ? ").to_i
      return true
    else
      return false
    end
  end
end
