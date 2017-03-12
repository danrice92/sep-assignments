require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    @pixel = pixel
    @x = validateX(x)
    @y = validateY(y)
  end

  def at(x, y)
    @pixel
  end

  private

  def validateX(x)
    if (x < 0 || x > @width)
      x = nil
    end
  end
  
  def validateY(y)
    if (y < 0 || y > @height)
      y = nil
    end
  end

end