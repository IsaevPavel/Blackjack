class Player
  attr_reader :name, :card_player, :total_points, :element, :parameter
  def initialize name
    @name=name
    @card_player=[]
    @total_points=0
    @element=0
    @parameter=nil
    @over=false
    @overflow=0
  end
  def choice(parameter)
    @parameter=parameter
  end
  def roll
    player_deck=[
        2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6,7,7,7,7,8,8,8,8,9,9,9,9,10,10,10,10,
        "J","J","J","J","Q","Q","Q","Q","K","K","K","K","A","A","A","A"
    ]
    @element=player_deck.delete(player_deck.sample)
    @card_player<<@element
  end
  def add_points(turn_points)
    if turn_points=="A"
      @total_points+=11
    elsif turn_points=="K"
      @total_points+=5
    elsif turn_points=="Q"
      @total_points+=4
    elsif turn_points=="J"
      @total_points+=3
    else
      @total_points+=turn_points
    end
  end
  def over?
    @overflow=@card_player.count(@element)
    if @parameter=='e' || @overflow==4 || @card_player.length==12
      @over=true
    end
  end
end