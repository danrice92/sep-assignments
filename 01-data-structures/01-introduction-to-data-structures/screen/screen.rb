require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = { }
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    x = validateX(x)
    y = validateY(y)
    @matrix["#{x}, #{y}"] = pixel
  end

  def at(x, y)
    @matrix["#{x}, #{y}"]
  end

  private

  def validateX(x)
    if (x < 0 || x > @width)
      nil
    else
      x
    end
  end
  
  def validateY(y)
    if (y < 0 || y > @height)
      nil
    else
      y
    end
  end

end