require './mc.rb'
require './plateau.rb'


class Rover
  attr_accessor :x_coord, :y_coord, :direction

  def initialize(x_coord, y_coord, direction)
    @x_coord   = x_coord
    @y_coord   = y_coord
    @direction = direction


  end

  def read_instruction(plateau, instructions)

    instructions.each do |i|
      if i == "L" || i == "R"
        turn(i)
      else
        move(plateau)
      end
    end
  end

  def turn(t)
    case @direction
    when "N"
      case t
      when "L"
        @direction = "W"
      when "R"
        @direction = "E"
      end

    when "S"
      case t
      when "L"
        @direction = "E"
      when "R"
        @direction = "W"
      end

    when "E"
      case t
      when "L"
        @direction = "N"
      when "R"
        @direction = "S"
      end

    when "W"
      case t
      when "L"
        @direction = "S"
      when "R"
        @direction = "N"
      end
    end

    @direction
  end

  def move(p)
    case @direction
    when "N"
      @y_coord += 1
    when "S"
      @y_coord -= 1
    when "E"
      @x_coord += 1
    when "W"
      @x_coord -= 1
    end
    unless p.check(self)
      raise "Incorrect input data. "
    end

  end


  def output
    puts "#{@x_coord} #{@y_coord} #{@direction}"
  end

end

puts "Please give me the size of the plateau!"
max = gets.gsub(/\s+/, "")
plateau = Plateau.new(max[0].to_i, max[1].to_i)

puts "The size of the plateau is #{ plateau.max_x } by #{ plateau.max_y }"

puts "How many rovers do you want to instruct?"
n = gets.gsub(/\s+/, "").to_i

n.times do
  mc = MissionControl.new()
  mc.do_it(plateau)
  # rover = Rover.new(mc.x_init, mc.y_init, mc.directions)
  # plateau.add_rover(rover)
  # rover.output
  # rover.read_instruction(mc.instructions)
  # rover.output

end
