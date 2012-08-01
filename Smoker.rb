
require 'gosu'

class Smoker

  def initialize(window)
    @p = Gosu::Image.new(window, "smoke_particle.png", true)
    @x = Random.rand(640)
    @y = Random.rand(480)
    @t = 0
  end

  def update
    @t = @t + 0.1
    @x = 640*Math.cos(@t)
#    @x += Random.rand(4) - 1.5
#    @y += Random.rand(4) - 1.5
  end

  def draw
    @p.draw(@x,@y,0)
  end

end
