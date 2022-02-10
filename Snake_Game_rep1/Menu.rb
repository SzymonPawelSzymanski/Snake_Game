require 'ruby2d'

class Menu
  GRID = 20
  def display_stuff
    Text.new("Welcome to the snake game!", x: (Window.width/2)-350, y:20, size: 55)
    Text.new("You can control the snake using arrows or WSAD keys.", x: (Window.width/2)-280, y:100, size: 25)
    Text.new("You can score points by eating apples.", x: (Window.width/2)-200, y:130, size: 25)
    Text.new("You lose when snake bits his tail.", x: (Window.width/2)-180, y:160, size: 25)
    Text.new("Press Spacebar to start the game.", x: (Window.width/2)-160, y:220, size: 25)
    Square.new(x: 30 * GRID, y: 20 * GRID, size: GRID - 1, color: 'white')
    Square.new(x: 31 * GRID, y: 20 * GRID, size: GRID - 1, color: 'white')
    Square.new(x: 32 * GRID, y: 20 * GRID, size: GRID - 1, color: 'white')
    Square.new(x: 33 * GRID, y: 20 * GRID, size: GRID - 1, color: 'white')
    Square.new(x: 34 * GRID, y: 20 * GRID, size: GRID - 1, color: 'white')
    Square.new(x: 35 * GRID, y: 20 * GRID, size: GRID - 1, color: 'white')
    Square.new(x: 36 * GRID, y: 20 * GRID, size: GRID - 1, color: 'white')
    Square.new(x: 37 * GRID, y: 20 * GRID, size: GRID - 1, color: 'white')
    Square.new(x: 37 * GRID, y: 19 * GRID, size: GRID - 1, color: 'white')
    Square.new(x: 37 * GRID, y: 18 * GRID, size: GRID - 1, color: 'white')
    Square.new(x: 37 * GRID, y: 17 * GRID, size: GRID - 1, color: 'white')
    Square.new(x: 37 * GRID, y: 16 * GRID, size: GRID - 1, color: 'white')
    Square.new(x: 38 * GRID, y: 16 * GRID, size: GRID - 1, color: 'white')
    Square.new(x: 39 * GRID, y: 16 * GRID, size: GRID - 1, color: 'white')
    Square.new(x: 40 * GRID, y: 16 * GRID, size: GRID - 1, color: 'white')
    Square.new(x: 41 * GRID, y: 16 * GRID, size: GRID - 1, color: 'white')
    Square.new(x: 23 * GRID, y: 20 * GRID, size: GRID - 1, color: '#b7b0b0')
  end

  def clear_stuff
    Window.clear
  end
end

