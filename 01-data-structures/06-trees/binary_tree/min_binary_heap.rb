require_relative 'node'
require 'benchmark'

class MinBinaryHeap
  attr_accessor :root

  def initialize(root)
    @root = root
    @childrenInBottomRow = 0
    @sizeOfBottomRow = 2
  end

  def insert(root, node)
    # if root.rating is higher, swap root and node and call insert recursively
    if root.rating > node.rating && root == @root
      if node.title == "Harry Potter and the Deathly Hallows Part 1"
        puts "== path"
      end
      @root = node
      node = root
      insert(@root, node)
    elsif root.rating > node.rating && root != @root
      tempRoot = root
      if root.parent.left == root
        root.parent.left = node
      elsif root.parent.right == root
        root.parent.right = node
      end
      insert(node, tempRoot)
    elsif root.rating < node.rating
      # if root.left or root.right is free, insert the node
      if root.left == nil
        @childrenInBottomRow = @childrenInBottomRow + 1
        node.parent = root
        root.left = node
      elsif root.right == nil
        @childrenInBottomRow = @childrenInBottomRow + 1
        node.parent = root
        root.right = node
      # otherwise, use @childrenInBottomRow and @sizeOfBottomRow to figure out where to go next
      else
        if @childrenInBottomRow < (@sizeOfBottomRow / 2)
          insert(root.left, node)
        elsif @childrenInBottomRow >= (@sizeOfBottomRow / 2) && @childrenInBottomRow < @sizeOfBottomRow
          insert(root.right, node)
        elsif @childrenInBottomRow == @sizeOfBottomRow
          @childrenInBottomRow = 0
          @sizeOfBottomRow = @sizeOfBottomRow * 2
          insert(root.left, node)
        else
          puts "Something went wrong..."
        end
      end
    else
      puts "404 (that's an error). Make sure that no Tomatometer ratings are duplicates and try again."
    end
  end

  def delete(root, name)
    if name == nil
      return nil
    else
      item = self.find(root, name)
      item.title = nil
      item.rating = nil
    end
  end

  def find(root, name)
    if name == nil
      return nil
    end
    searchArray = [root]
    searchArray.each do |n|
      if n.title == name
        return n
      else
        if n.left != nil
          searchArray.push(n.left)
        end
        if n.right != nil
          searchArray.push(n.right)
        end
      end
    end
  end

  def print
    output = []
    children = [@root]
    children.each do |i|
      output.push("#{i.title}: #{i.rating}")
      if i.left != nil
        children.push(i.left)
      end
      if i.right != nil
        children.push(i.right)
      end
    end
    puts output
  end

  stone = Node.new("Harry Potter and the Sorcerer's Stone", 80)
  chamber = Node.new("Harry Potter and the Chamber of Secrets", 82)
  prisoner = Node.new("Harry Potter and the Prisoner of Azkaban", 91)
  goblet = Node.new("Harry Potter and the Goblet of Fire", 88)
  order = Node.new("Harry Potter and the Order of the Phoenix", 78)
  prince = Node.new("Harry Potter and the Half-Blood Prince", 84)
  hallows1 = Node.new("Harry Potter and the Deathly Hallows Part 1", 79)
  hallows2 = Node.new("Harry Potter and the Deathly Hallows Part 2", 96)
  beasts = Node.new("Fantastic Beasts and Where to Find Them", 73)
  matrix = Node.new("The Matrix", 87)
  atlas = Node.new("Cloud Atlas", 66)
  vendetta = Node.new("V for Vendetta", 72)

  binaryHeap = MinBinaryHeap.new(stone)

  binaryHeap.insert(binaryHeap.root, chamber)
  binaryHeap.insert(binaryHeap.root, prisoner)
  binaryHeap.insert(binaryHeap.root, goblet)
  binaryHeap.insert(binaryHeap.root, order)
  binaryHeap.insert(binaryHeap.root, prince)
  binaryHeap.insert(binaryHeap.root, hallows1)
  binaryHeap.insert(binaryHeap.root, hallows2)
  binaryHeap.insert(binaryHeap.root, beasts)
  binaryHeap.insert(binaryHeap.root, matrix)
  binaryHeap.insert(binaryHeap.root, atlas)
  binaryHeap.insert(binaryHeap.root, vendetta)

  binaryHeap.print

  arrayOfNumbers = []

  i = 0

  while i <= 10000
    arrayOfNumbers.push(Node.new(i, i))
    i = i + 1
  end

  numberHeap = MinBinaryHeap.new(arrayOfNumbers[0])

  arrayOfNumbers.each do |i|
    numberHeap.insert(numberHeap.root, i)
  end

  puts Benchmark.measure { numberHeap.find(numberHeap.root, 5000) }

  # 3.33 seconds for insertion of 10,000 elements
  #.001 seconds to find the number 5000

  numberHeap.print
end
