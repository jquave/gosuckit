
require 'gosu'

class Smoker

  def initialize(window, startx, starty, player)
    @player = player
    @p = Gosu::Image.new(window, "smoke_particle.png", true)
    @x = startx
    @y = starty
    @xvel = 0
    @yvel = 0
    @t = 0
    @isRunning = false
    @life = 5000 # life span of particle in ms
    @originalPosition = { "x" => startx, "y" => starty}
    @worldSpawnPos = { "x" => @player.x, "y" => @player.y }
  end
  
  attr_accessor :xvel, :yvel, :life

  def update
puts "t: #{@t},   life: #{@life}"
 puts "original x: " +  @originalPosition['x'].to_s
    if @t>(@life/1000.0)
      # Reset particle
      @t = 0
      @x = @originalPosition['x']
      @y = @originalPosition['y']
    end

    return if !@isRunning
    @t = @t + 0.1
    @x = @x + @xvel
    @y = @y + @yvel
  end

  def draw
    @p.draw(@x-@player.x+@worldSpawnPos['x'],@y,0)
  end

  def startEmitting
    @isRunning = true
  end

  def stopEmitting
    @isRunning = false
  end

end
