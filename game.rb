require 'gosu'
require './Smoker'
require './Player'
require './TilingBackground.rb'

class GameWindow < Gosu::Window
  def initialize
    super 640, 480, false
    self.caption = "Go Suck It"
    
    @player = Player.new(self)
    @bg = TilingBackground.new(self, @player, "12-Grass-Texture-III.jpeg")

    @bgs = Array.new
    (1..5).each do |i|
      b = TilingBackground.new(self,@player,"trees.png")
      b.scrollSpeed = i
      @bgs << b
    end

  end

  def update
    @player.update
    @bg.update
    @bgs.each do |bg|
      bg.update
    end


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
    # Handle button depresses here if needed
  end

end

window = GameWindow.new
window.show
