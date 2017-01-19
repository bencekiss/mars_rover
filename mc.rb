# require './rover.rb'

class MissionControl
  attr_reader :x_init, :y_init, :directions, :instructions

  def initialize()
    puts "Please give me the initial position and direction of the rover!"
    position = gets.gsub(/\s+/, "")
    @x_init = position[0].to_i
    @y_init = position[1].to_i
    @directions = position[2].upcase

    puts "Please give me the instructions!"
    instructions = gets.gsub(/\s+/, "")
    @instructions = instructions.upcase.split(//)

  end


  def do_it
    rover = Rover.new(@x_init, @y_init, @directions)
    rover.output
    rover.read_instruction(@instructions)
    rover.output
  end

end
