class Snake #snake class
  attr_writer :which_way #lets me overwrite the @which_way attribute
  def initialize
    @coordinates = [[25,16], [25,17], [25,18], [25,19]]
    @which_way = 'down'
    @ate = false
  end

  def feed
    @ate = true
  end

  def draw #draws the snake moving
    @coordinates.each do |current_pos|
      Square.new(x: current_pos[0] * GRID, y: current_pos[1] * GRID, size: GRID - 1, color: 'white')
    end
  end

  def move #controls directions of the snake
    if !@ate
      @coordinates.shift
    end
    case @which_way
    when 'down'
      @coordinates.push(cords_mod(head_pos[0], head_pos[1] + 1))
    when 'up'
      @coordinates.push(cords_mod(head_pos[0], head_pos[1] - 1))
    when 'right'
      @coordinates.push(cords_mod(head_pos[0] + 1, head_pos[1]))
    when 'left'
      @coordinates.push(cords_mod(head_pos[0] - 1, head_pos[1]))
    when 's'
    @coordinates.push(cords_mod(head_pos[0], head_pos[1] + 1))
    when 'w'
    @coordinates.push(cords_mod(head_pos[0], head_pos[1] - 1))
    when 'd'
    @coordinates.push(cords_mod(head_pos[0] + 1, head_pos[1]))
    when 'a'
    @coordinates.push(cords_mod(head_pos[0] - 1, head_pos[1]))
  end
    @ate = false
  end

  def can_change_way(new_way) #checks if snake can change direction to the kay that is pressed
    case @which_way
    when 'down'  then new_way != 'up'
    when 'up' then new_way != 'down'
    when 'right' then new_way != 'left'
    when 'left' then new_way != 'right'
    when 's'  then new_way != 'up'
    when 'w' then new_way != 'down'
    when 'd' then new_way != 'left'
    when 'a' then new_way != 'right'
    end
  end

  def head_x
    head_pos[0]
  end

  def head_y
    head_pos[1]
  end

  def bit_tail?
    @coordinates.uniq.length != @coordinates.length
  end

  private

  def cords_mod(x, y)
    [x % GRID_W, y % GRID_H]
  end

  def head_pos
    @coordinates.last
  end
end
