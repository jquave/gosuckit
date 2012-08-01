require 'gosu'
require './Smoker'
require './Player'
require './TilingBackground.rb'

class GameWindow < Gosu::Window
  def initialize
    super 640, 480, false
    self.caption = "Go Suck It"
#    @bg = Gosu::Image.new(self, "space.jpg", true)
#    @s = Smoker.new(self)
 #   @particles = Array.new
  #  numParticles = 10
   # (0..numParticles).each { |f|
   #   @particles << Smoker.new(self)
   # }
    @player = Player.new(self)
    @bg = TilingBackground.new(self, @player, "12-Grass-Texture-III.jpeg")

    @bgs = Array.new
    (1..5).each do |i|
      b = TilingBackground.new(self,@player,"trees.png")
      b.scrollSpeed = i
#      b.scale = Math.sqrt(i)
      @bgs << b
    end

#    @bgFront = TilingBackground.new(self, @player, "trees.png")
#    @bgFront.scrollSpeed = 2
#    
#    @bgBack = TilingBackground.new(self, @player, "trees.png")
#    @bgBack.scrollSpeed = 3

  end

  def update
#    @particles.each { |p| p.update }
    @player.update
    @bg.update
#    @bgFront.update
#    @bgBack.update
    @bgs.each do |bg|
      bg.update
    end


#    if button_down? Gosu::KbA or button_down? Gosu::KbD then
#      @player.isWalking = true
#    else
#      @player.isWalking = false                                 
#    end

    @player.isWalking = (button_down? Gosu::KbA or button_down? Gosu::KbD)

    # Only continue processing jump if they were already jumping
    if @player.isJumping
      @player.isJumping = (button_down? Gosu::KbSpace)
    end

  end

  def draw
    @bg.draw

    @bgs.each do |bg|
      bg.draw
    end
    @player.draw
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end








    if id == Gosu::KbD || id == Gosu::KbA
      @player.isWalking = true
    end
   if id == Gosu::KbD
     @player.walkRight
   end
   if id == Gosu::KbA
     @player.walkLeft
   end

   if (id != Gosu::KbA) and (id != Gosu::KbD)
     @player.isWalking = false
   end

    if id == Gosu::KbSpace and !@player.isJumping
      @player.isJumping = true
    end

  end

  def button_up(id)
 #   if id == Gosu::KbD || id == Gosu::KbA
 #     @player.isWalking = false
 #   end
  end

end

window = GameWindow.new
window.show
