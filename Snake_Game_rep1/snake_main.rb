require 'ruby2d'

set background: '#9b0a38'
set width: 1020 #1020/20 = 51
set height: 720 #720/20 = 36
set fps_cap: 15
GRID = 20
GRID_W = Window.width / GRID
GRID_H = Window.height / GRID

class Snake
  attr_writer :which_way
  def initialize
    @coordinates = [[2,0], [2,1], [2,2], [2,3]]
    @which_way = 'down'
    @ate = false
  end

  def feed
    @ate = true
  end

  def draw
    @coordinates.each do |current_pos|
      Square.new(x: current_pos[0] * GRID, y: current_pos[1] * GRID, size: GRID - 1, color: 'white')
    end
  end

  def move
    @coordinates.shift
    case @which_way
    when 'down'
      @coordinates.push(cords_mod(head_pos[0], head_pos[1] + 1))
    when 'up'
      @coordinates.push(cords_mod(head_pos[0], head_pos[1] - 1))
    when 'right'
      @coordinates.push(cords_mod(head_pos[0] + 1, head_pos[1]))
    when 'left'
      @coordinates.push(cords_mod(head_pos[0] - 1, head_pos[1]))
    end
  end

  def can_change_way(new_way)
    case @which_way
    when 'down' then new_way != 'up'
    when 'up' then new_way != 'down'
    when 'right' then new_way != 'left'
    when 'left' then new_way != 'right'
    end
  end

  def head_x
    head_pos[0]
  end

  def head_y
    head_pos[1]
  end

  private

  def cords_mod(x, y)
    [x % GRID_W, y % GRID_H]
  end

  def head_pos
    @coordinates.last
  end
end

class Game_elements
  def initialize
    @points = 0
    @apple_x = rand(GRID_W)
    @apple_y = rand(GRID_H)
  end



  def draw
    #Circle.new(x: @apple_x * GRID, y: @apple_y * GRID, radius: (GRID/2), sectors: 32, color: '#b7b0b0')
    Square.new(x: @apple_x * GRID, y: @apple_y * GRID, size: GRID - 1, color: '#b7b0b0')
    Text.new("Wynik: #{@points}", x:10, y:10, size:20)
  end
end

content = Game_elements.new
wezyk = Snake.new

update do
  clear
  content.draw
  wezyk.draw
  wezyk.move

  if Game_elements.snake_ate_apple?(wezyk.head_x, wezyk.head_y)
    Game_elements.get_point
  end

end

on :key_down do |event|
  puts event.key
  if ['down', 'up', 'right', 'left'].include?(event.key)
    if wezyk.can_change_way(event.key)
      wezyk.which_way = event.key
    end
  end
end

show

