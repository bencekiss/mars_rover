# require_relative './rover.rb'
# require_relative './mc.rb'

class Plateau
  attr_reader :max_x, :max_y, :rovers

  @@rovers = []

  def initialize(max_x, max_y)
    @max_x = max_x
    @max_y = max_y

  end

  def self.add_rover(r)
    @@rovers << r
  end

  def update_position(r)
    @@rovers.each do |rov|
      if rov == r
        rov.x_coord = r.x_coord
        rov.y_coord = r.y_coord
      end
    end
  end
  # Need a method to check if there was a collision
  def collision(r)
    if @@rovers.empty?
      return false
    else
      @@rovers.each do |rover|
        if rover != r && rover.x_coord == r.x_coord && rover.y_coord == r.y_coord
          puts "There is a collision at #{ r.x_coord } and #{ r.y_coord }."
          return true
        end
      end
    end
    return false
  end

  def out_of_bounds(r)
    if (r.x_coord > @max_x) || (r.x_coord < 0) || (r.y_coord > @max_y) || (r.y_coord < 0)
      puts "The rover is out of bounds"
      return true
    end
    return false
  end

  def check(att_rover)
    col = collision(att_rover)
    out = out_of_bounds(att_rover)
    # true only when both are false
    # false if at least one is true
    return !(col || out)
  end

end
