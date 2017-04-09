require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor
  attr_reader :item_count

  def initialize(size)
    @items = Array.new(size)
    @item_count = 0.0
    @max_load_factor = 0.7
  end

  def []=(key, value)
    ind = self.index(key, size)
    if @items[ind] == nil
      @items[ind] = LinkedList.new
    end
    @items[ind].add_to_tail(Node.new(key, value))
    @item_count += 1
    if load_factor >= @max_load_factor
      self.resize
    end
  end

  def [](key)
    ind = self.index(key, size)
    if @items[ind]
      current = @items[ind].head
      while current != nil
        if current.key == key
          return current.value
        else
          current = current.next
        end
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    @item_count / size
  end

  def size
    @items.length
  end

  # Resize the hash

  def resize
    old_array = @items
    @items = Array.new(old_array.length * 2)
    old_array.each do |i|
      if i
        current = i.head
        if current
          ind = self.index(current.key, @items.length)
          if @items[ind] == nil
            @items[ind] = LinkedList.new
            @items[ind].add_to_tail(Node.new(current.key, current.value))
            if load_factor >= @max_load_factor
              self.resize
            end
            current = current.next
          else
            @items[ind].add_to_tail(Node.new(current.key, current.value))
            if load_factor >= @max_load_factor
              self.resize
            end
            current = current.next
          end
        end
      end
    end
  end

  def status
    puts "Load factor: #{load_factor}, number of items in hash: #{item_count}"
    @items.each do |list|
      if list != nil
        current = list.head
        while current != nil
          puts "Key: #{current.key}, Value: #{current.value}"
          current = current.next
        end
      end
    end
  end

end
