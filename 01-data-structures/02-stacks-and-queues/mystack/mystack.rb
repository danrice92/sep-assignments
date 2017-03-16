class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack << item
    self.top = item
  end

  def pop
    popItem = self.top
    @stack.delete(top)
    self.top = @stack.last
    popItem
  end

  def empty?
    if @stack.length == 0
      return true
    else
      return false
    end
  end
end