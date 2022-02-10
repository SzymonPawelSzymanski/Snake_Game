require 'ruby2d'
class Game_elements #game content class
  GRID = 20
  GRID_W = Window.width / GRID
  GRID_H = Window.height / GRID

  #defining basic stuff
  def initialize
    @points = 0
    @apple_x = rand(GRID_W)
    @apple_y = rand(GRID_H)
    @started = false
    @finished = false
  end

  #message displayed on the top of the screen
  def top_message
    if finished?
      "The snake bit himself! Your score is #{@points} points. Press R to reset the game."
    else
      "Score: #{@points}"
    end
  end

  #this draws apples when the game isn't finished
  def draw
    unless finished?
      Square.new(x: @apple_x * GRID, y: @apple_y * GRID, size: GRID - 1, color: '#b7b0b0')
    end
    Text.new(top_message, x:10, y:10, size:25) #also displays the message
  end

  def get_point
    @points += 1
    @apple_x = rand(GRID_W)
    @apple_y = rand(GRID_H)
  end

  def snake_ate_apple?(x, y) #if snakes head coordinates match the apple coordinates returns true
    @apple_x == x && @apple_y ==y
  end

  def start
    @started = true
  end

  def started?
    @started
  end

  def finish
    @finished = true
  end

  def finished? #returns if the game is finioshed
    @finished
  end

end