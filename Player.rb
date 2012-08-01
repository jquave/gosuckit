

require 'gosu'


class Player
  def initialize(window)
#    @img = Gosu::Image.new(window, "player.png", true)
    @tiles = Gosu::Image.load_tiles(window, "player.png", 64, 63, true)
    @ry = 480-64
    @rx = 150
    @frame = 0
    @isWalking = false
    @direction = 1
    @x = 0
    @y = 0


    # Level begin state
    @isJumping = false
    @yv = 0

    # Gameplay adjustments
    @walkspeed = 1
    @maxjumpspeed = 10

  end

  attr_accessor :isWalking, :x, :y, :isJumping

  def grounded
    return (@y<1)
  end
  
  def update
      puts "x: #{@x},  y: #{@y}, jump: #{@isJumping}"


    if grounded
      @yv = 0
    else
      yold = @yv
      @yv = [@yv-1, -@maxjumpspeed].max
      @ydiff = @yv - yold
    end

    if @isJumping
      if grounded
        @yv = @maxjumpspeed
      else
        @yv = @yv - @ydiff/2.0
      end
    end

    @y = @y + @yv

    if !@isWalking
      return
    end

    @frame = @frame + 0.25
    if(@frame>@tiles.length-1)
      @frame=0
    end

    @x = @x + @walkspeed*@direction

  end

  def draw
#    @img.draw(@x,@y,0)
    @tiles[@frame].draw_rot(@rx,@ry,0, 0, 0.5,0,-@direction,1)
  end

  def walkLeft
    @direction = -1
    @isWalking = true
  end

  def walkRight
    @direction = 1
    @isWalking = true
  end

end
