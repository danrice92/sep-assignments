require 'benchmark'

def merge_sort(collection)
   # #1
   if collection.length <= 1
     collection
   else
     # #2
     mid = (collection.length / 2).floor
     left = merge_sort(collection[0..mid - 1])
     right = merge_sort(collection[mid..collection.length])
     # #3
     merge(left, right)
   end
 end

 def merge(left, right)
   if left.empty?
     # #4
     right
   elsif right.empty?
     # #5
     left
   elsif left.first < right.first
     # #6
     [left.first] + merge(left[1..left.length], right)
   else
     # #7
     [right.first] + merge(left, right[1..right.length])
   end
 end

 array = [12, 33, 7, 20, 44, 10, 13, 25, 27, 11, 6, 48, 14, 17, 38, 45, 34, 32, 18, 49, 50, 21, 22, 46, 23, 8, 24, 26, 4, 29, 30, 31, 36, 5, 37, 16, 39, 1, 41, 43, 3, 15, 19, 35, 47, 9, 40, 28, 2, 42]

 puts Benchmark.measure { merge_sort(array) }

 p merge_sort(array)
