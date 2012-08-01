
require 'gosu'

class TilingBackground
  def initialize(window, player, fn)


    @img = Gosu::Image.new(window, fn, true)

    @xoffset = 0
    @yoffset = 0

    @player = player
    @scrollSpeed = 1
    @scale = 1


    # Offset of this image
    @xo = 0
    @yo = 0

  end

  attr_accessor :xo, :yo, :scrollSpeed, :scale

  def update


  end

  def draw

    @scalex = @scale
    @scaley = @scale

    @xoffset = -@scrollSpeed*@player.x % @img.width
    @yoffset = @scrollSpeed*@player.y % @img.height

    @img.draw_rot(@xoffset ,@yoffset ,0,0,0,@scalex,@scaley)
    @img.draw_rot(@xoffset -@img.width,@yoffset ,0,0,0,@scalex,@scaley)
    @img.draw_rot(@xoffset ,@yoffset -@img.height,0,0,0,@scalex,@scaley)
    @img.draw_rot(@xoffset +@img.width,@yoffset ,0,0,0,@scalex,@scaley)
    @img.draw_rot(@xoffset ,@yoffset +@img.height,0,0,0,@scalex,@scaley)
    
    @img.draw_rot(@xoffset -@img.width,@yoffset -@img.height,0,0,0,@scalex,@scaley)
    @img.draw_rot(@xoffset +@img.width,@yoffset +@img.height,0,0,0,@scalex,@scaley)
    @img.draw_rot(@xoffset -@img.width,@yoffset +@img.height,0,0,0,@scalex,@scaley)
    @img.draw_rot(@xoffset +@img.width,@yoffset -@img.height,0,0,0,@scalex,@scaley)



     
  end

end
