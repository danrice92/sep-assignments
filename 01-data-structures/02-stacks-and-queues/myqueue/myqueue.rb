class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue.last
  end

  def enqueue(element)
    @queue.insert(0, element)
    @head = @queue[0]
    @tail = @queue.last
  end

  def dequeue
    dequeueItem = @tail
    @queue.delete(@tail)
    @tail = @queue.last
    dequeueItem
  end

  def empty?
    if @queue.length == 0
      return true
    else
      return false
    end
  end
end