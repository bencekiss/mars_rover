$max_x = 0
$max_y = 0

class Rover

  def initialize(x_coord, y_coord, direction)
    @x_coord   = x_coord
    @y_coord   = y_coord
    @direction = direction


  end

  def read_instruction(instructions)

    instructions.each do |i|
      if i == "L" || i == "R"
        turn(i)
      else
        move
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

  def move
    case @direction
    when "N"
      if @y_coord >= $max_y
        raise "Incorrect y_coord data"
      else
        @y_coord += 1
      end
    when "S"
      if @y_coord <= 0
        raise "Incorrect y_coord data"
      else
        @y_coord -= 1
      end
    when "E"
      if @x_coord >= $max_x
        raise "Incorrect x_coord data"
      else
        @x_coord += 1
      end
    when "W"
      if @x_coord <= 0
        raise "Incorrect x_coord data"
      else
        @x_coord -= 1
      end
    end

  end


  def output
    puts "#{@x_coord} #{@y_coord} #{@direction}"
  end

end

puts "Please give me the size of the plateau!"
max = gets.gsub(/\s+/, "")
$max_x = max[0].to_i
$max_y = max[1].to_i
puts "The size of the plateau is #{$max_x} by #{$max_y}"

2.times do

  puts "Please give me the initial position and direction of the rover!"
  position = gets.gsub(/\s+/, "")
  rover = Rover.new(position[0].to_i, position[1].to_i, position[2].upcase)

  rover.output

  puts "Please give me the instructions!"
  instructions = gets.gsub(/\s+/, "")
  instructions = instructions.upcase.split(//)
  rover.read_instruction(instructions)
  rover.output
end
