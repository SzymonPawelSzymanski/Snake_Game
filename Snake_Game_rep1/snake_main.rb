require 'ruby2d'
require './Snake.rb' #snake class
require './Game_elements.rb' #game content class
require './Menu' #menu - obviously


#game settings
set background: '#9b0a38'
set width: 1020 #1020/20 = 51
set height: 720 #720/20 = 36
set fps_cap: 10

#grid in which snake is moving
GRID = 20
GRID_W = Window.width / GRID
GRID_H = Window.height / GRID

content = Game_elements.new
wezyk = Snake.new
menu = Menu.new

#update being done @fps_cap times a second
update do
  if content.started?
  clear
  content.draw
  wezyk.draw
  unless content.finished?
    wezyk.move
  end

  if content.snake_ate_apple?(wezyk.head_x, wezyk.head_y) #if snake eats an apple he gets a point and grows longer
    content.get_point
    wezyk.feed
  end

  if wezyk.bit_tail? #if snake bits his tail then game finishes
    content.finish
  end
  else
    menu.display_stuff
  end
end

#what happens when certain keys are pressed
on :key_down do |event|
  puts event.key
  if ['down', 'up', 'right', 'left', 'w', 's', 'a', 'd'].include?(event.key) #changing directions of the snake
    if wezyk.can_change_way(event.key)
      wezyk.which_way = event.key
    end
  elsif event.key == "r" #restarting the game
    clear
         content = Game_elements.new
         wezyk = Snake.new
  elsif event.key == 'space'
    menu.clear_stuff
    content.start
  end
end

show

