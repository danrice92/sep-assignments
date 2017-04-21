require_relative 'node'
require 'Benchmark'

class BinarySearchTree

  def initialize(root)
    @root = root
    @root.skip = false
  end

  # uses depth-first search to find the place to add the data as a new leaf
  def insert(root, node)
    #if root rating is greater than node rating, go to the left
    if root.rating > node.rating && root.left == nil
      root.left = node
      root.left.parent = root
      root.left.skip = false
    elsif root.rating > node.rating && root.left != nil
      root = root.left
      insert(root, node)
    #if root rating is lower than node rating, go to the right
    elsif root.rating < node.rating && root.right == nil
      root.right = node
      root.right.parent = root
      root.right.skip = false
    elsif root.rating < node.rating && root.right != nil
      root = root.right
      insert(root, node)
    else
      puts "404 (that's an error). Make sure that no Tomatometer ratings are duplicates and try again."
    end
  end

  # Recursive Depth First Search, returns a node object which contains the data var if found
  def find(root, data)
    if data == nil
      return nil
    elsif root.title == data
      return root
    elsif root.title != data && root.left != nil && root.left.skip == false
      root = root.left
      find(root, data)
    elsif root.title != data && root.right != nil && root.right.skip == false
      root = root.right
      find(root, data)
    else
      root.skip = true
      root = root.parent
      find(root, data)
    end
  end

  # Removes the node which contains the given data variable without losing other nodes in the tree. Tree remains a binary search tree after deletion.
  def delete(root, data)
    if data == nil
      return nil
    else
      item = self.find(root, data)
      item.title = nil
      item.rating = nil
    end
  end

  # Recursive Breadth First Search, prints each node's data of the tree on one line from top to bottom
  def printf
    output = []
    children = []
    output.push("#{@root.title}: #{@root.rating}")
    if @root.left != nil
      children.push(@root.left)
    end
    if @root.right != nil
      children.push(@root.right)
    end
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

  binaryTree = BinarySearchTree.new(stone)

  binaryTree.insert(stone, chamber)
  binaryTree.insert(stone, prisoner)
  binaryTree.insert(stone, goblet)
  binaryTree.insert(stone, order)
  binaryTree.insert(stone, prince)
  binaryTree.insert(stone, hallows1)
  binaryTree.insert(stone, hallows2)
  binaryTree.insert(stone, beasts)
  binaryTree.insert(stone, matrix)
  binaryTree.insert(stone, atlas)
  binaryTree.insert(stone, vendetta)

  binaryTree.printf

  i = 0

  arrayOfNumbers = []

  while i <= 10000
    arrayOfNumbers.push(Node.new(i, i))
    i = i + 1
  end

  numberTree = BinarySearchTree.new(arrayOfNumbers[0])

  arrayOfNumbers.each do |i|
    numberTree.insert(arrayOfNumbers[0], i)
  end

  puts Benchmark.measure {
    numberTree.find(arrayOfNumbers[0], 5000)
  }

  # 12.65 seconds for insertion of 10,000 elements
  # .001 seconds to find the number 5000
  
  numberTree.printf
end
