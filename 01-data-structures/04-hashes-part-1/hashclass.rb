require_relative 'hash_item'

class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

# Add a new object
  def []=(key, value)
    if @items[index(key, @items.length)] == nil
      @items[index(key, @items.length)] = HashItem.new(key, value)
    elsif @items[index(key, @items.length)].key != key
      self.resize
      self[key] = value
    elsif @items[index(key, @items.length)].key == key && @items[index(key, @items.length)].value != value
      self.resize
      @items[index(key, @items.length)].value = value
    end
  end

# Return the value when given the key
  def [](key)
    if @items[index(key, @items.length)] != nil && @items[index(key, @items.length)].key == key
      @items[index(key, @items.length)].value
    end
  end

# Double the array size and move all items in it to new spots in the larger array
  def resize
    old_array = @items
    @items = Array.new(old_array.length * 2)
    old_array.each do |x|
      unless x == nil
        if @items[index(x.key, @items.length)] == nil
          self[x.key] = x.value
        elsif @items[index(x.key @items.length)].key != key
          self.resize
          self[x.key] = x.value
        elsif @items[index(x.key, @items.length)].key === key && @items[index(x.key, @items.length)].value != value
          self.resize
          @items[index(x.key, @items.length)].value = x.value
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

  def size
    @items.length
  end

end