require 'benchmark'

class Node
  attr_accessor :value
  attr_accessor :left
  attr_accessor :right
  attr_accessor :parent
  attr_accessor :skip

  def initialize(value)
    @value = value
  end
end

class MinBinaryHeap
  attr_accessor :root
  attr_accessor :length

  def initialize(root)
    @root = root
    @childrenInBottomRow = 0
    @sizeOfBottomRow = 2
    @length = 1
  end

  def insert(root, node)
    # if root.value is higher, swap root and node and call insert recursively



    if root.value > node.value && root == @root
      @root = node
      @root.parent = nil
      node = root
      insert(@root, node)
    elsif root.value > node.value && root != @root
      futureNode = root
      if root.parent.left == root
        root.parent.left = node
      elsif root.parent.right == root
        root.parent.right = node
      end
      node.parent = root.parent
      insert(node, futureNode)
    elsif root.value < node.value
      # if root.left or root.right is free, insert the node
      if root.left == nil
        @childrenInBottomRow = @childrenInBottomRow + 1
        node.parent = root
        root.left = node
        @length += 1
        # puts "#{node.value} inserted successfully. Its parent is #{node.parent.value}."
      elsif root.right == nil
        @childrenInBottomRow = @childrenInBottomRow + 1
        node.parent = root
        root.right = node
        @length += 1
        # puts "#{node.value} inserted successfully. Its parent is #{node.parent.value}."
      # otherwise, use @childrenInBottomRow and @sizeOfBottomRow to figure out where to go next
      else
        if @childrenInBottomRow < (@sizeOfBottomRow / 2)
          insert(root.left, node)
        elsif @childrenInBottomRow >= (@sizeOfBottomRow / 2) && @childrenInBottomRow < @sizeOfBottomRow
          insert(root.right, node)
        else
          @childrenInBottomRow = 0
          @sizeOfBottomRow = @sizeOfBottomRow * 2
          insert(root.left, node)
        end
      end
    else
      puts "404 (that's an error). Make sure that no values are duplicates and try again."
    end
  end

  def delete(value)
    if value == nil
      return nil
    else
      item = self.find(value)
      if item.value != @root.value
        item.value = nil
      elsif item.value == @root.value
        self.restructure
      end
    end
    @length -= 1
  end

# method to reorganize the heap when elements are removed
  def restructure
    heapArray = [@root]
    heapArray.each do |i|
      heapArray.push(i.left) if i.left != nil
      heapArray.push(i.right) if i.right != nil
    end
    if @length == 1
      @root.value = 1
      return
    end
    lowestNumber = -1
    heapArray[1.. heapArray.length - 1].each do |j|
      if j.value != nil
        if lowestNumber == -1 || j.value < lowestNumber
          lowestNumber = j.value
        end
      end
    end
    newValue = lowestNumber
    delete(lowestNumber)
    @root.value = newValue
  end

# returns the node of the given value by taking the current root node's name and the value we're searching for
  def find(value)
    if value == nil
      return nil
    end
    searchArray = [@root]
    searchArray.each do |n|
      if n.value == value
        return n
      else
        searchArray.push(n.left) if n.left != nil
        searchArray.push(n.right) if n.right != nil
      end
    end
  end

  def print
    output = []
    children = [@root]
    children.each do |i|
      children.push(i.left) if i.left != nil
      children.push(i.right) if i.right != nil
      if i.parent == nil
        puts "#{i.value} is in the heap as the root value."
      else
        puts "#{i.value} is in the heap. Its parent is #{i.parent.value}."
      end
    end
  end
end

def heap_sort(heap)
  sorted_array = []
  while heap.length > 0
    sorted_array.push(heap.root.value)
    heap.delete(heap.root.value)
  end
  p sorted_array
end

A = Node.new(12)
B = Node.new(33)
C = Node.new(7)
D = Node.new(20)
E = Node.new(44)
F = Node.new(10)
G = Node.new(13)
H = Node.new(25)
I = Node.new(27)
J = Node.new(11)
K = Node.new(6)
L = Node.new(48)
M = Node.new(14)
N = Node.new(17)
O = Node.new(38)
P = Node.new(45)
Q = Node.new(34)
R = Node.new(32)
S = Node.new(18)
T = Node.new(49)
U = Node.new(50)
V = Node.new(21)
W = Node.new(22)
X = Node.new(46)
Y = Node.new(23)
Z = Node.new(8)
AA = Node.new(24)
AB = Node.new(26)
AC = Node.new(4)
AD = Node.new(29)
AE = Node.new(30)
AF = Node.new(31)
AG = Node.new(36)
AH= Node.new(5)
AI = Node.new(37)
AJ = Node.new(16)
AK = Node.new(39)
AL = Node.new(1)
AM = Node.new(41)
AN = Node.new(43)
AO = Node.new(3)
AP = Node.new(15)
AQ = Node.new(19)
AR = Node.new(35)
AS = Node.new(47)
AT = Node.new(9)
AU = Node.new(40)
AV = Node.new(28)
AW = Node.new(2)
AX = Node.new(42)

largeHeap = MinBinaryHeap.new(A)
largeHeap.insert(largeHeap.root, B)
largeHeap.insert(largeHeap.root, C)
largeHeap.insert(largeHeap.root, D)
largeHeap.insert(largeHeap.root, E)
largeHeap.insert(largeHeap.root, F)
largeHeap.insert(largeHeap.root, G)
largeHeap.insert(largeHeap.root, H)
largeHeap.insert(largeHeap.root, I)
largeHeap.insert(largeHeap.root, J)
largeHeap.insert(largeHeap.root, K)
largeHeap.insert(largeHeap.root, L)
largeHeap.insert(largeHeap.root, M)
largeHeap.insert(largeHeap.root, N)
largeHeap.insert(largeHeap.root, O)
largeHeap.insert(largeHeap.root, P)
largeHeap.insert(largeHeap.root, Q)
largeHeap.insert(largeHeap.root, R)
largeHeap.insert(largeHeap.root, S)
largeHeap.insert(largeHeap.root, T)
largeHeap.insert(largeHeap.root, U)
largeHeap.insert(largeHeap.root, V)
largeHeap.insert(largeHeap.root, W)
largeHeap.insert(largeHeap.root, X)
largeHeap.insert(largeHeap.root, Y)
largeHeap.insert(largeHeap.root, Z)
largeHeap.insert(largeHeap.root, AA)
largeHeap.insert(largeHeap.root, AB)
largeHeap.insert(largeHeap.root, AC)
largeHeap.insert(largeHeap.root, AD)
largeHeap.insert(largeHeap.root, AE)
largeHeap.insert(largeHeap.root, AF)
largeHeap.insert(largeHeap.root, AG)
largeHeap.insert(largeHeap.root, AH)
largeHeap.insert(largeHeap.root, AI)
largeHeap.insert(largeHeap.root, AJ)
largeHeap.insert(largeHeap.root, AK)
largeHeap.insert(largeHeap.root, AL)
largeHeap.insert(largeHeap.root, AM)
largeHeap.insert(largeHeap.root, AN)
largeHeap.insert(largeHeap.root, AO)
largeHeap.insert(largeHeap.root, AP)
largeHeap.insert(largeHeap.root, AQ)
largeHeap.insert(largeHeap.root, AR)
largeHeap.insert(largeHeap.root, AS)
largeHeap.insert(largeHeap.root, AT)
largeHeap.insert(largeHeap.root, AU)
largeHeap.insert(largeHeap.root, AV)
largeHeap.insert(largeHeap.root, AW)
largeHeap.insert(largeHeap.root, AX)

puts Benchmark.measure { heap_sort(largeHeap) }

heap_sort(largeHeap)
