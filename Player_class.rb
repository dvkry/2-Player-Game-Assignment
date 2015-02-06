class Player
  attr_reader :name
  attr_accessor :lives, :points

  def initialize(name)
    @name = name
    @points = 0
    @lives = 3
  end

  # sets a players name via interface
  def get_name(interface, player)
    @name = interface.ask_user("#{player.name}, what is your name? ")
    while @name == ''
      @name = interface.ask_user("That's a terrible name, try another! ")
    end
    @name.capitalize!
  end

  def reset
    @points = 0
    @lives = 3
  end
end