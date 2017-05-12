require 'benchmark'

def bubble_sort(collection)
   n = collection.length
   # #1
   begin
     swapped = false

     # #2
     (n - 1).times do |i|
       # #3
       if collection[i] > collection[i + 1]
         tmp = collection[i]
         collection[i] = collection[i + 1]
         collection[i + 1] = tmp
         swapped = true
       end
     end
   end until not swapped

   collection
 end

array = [12, 33, 7, 20, 44, 10, 13, 25, 27, 11, 6, 48, 14, 17, 38, 45, 34, 32, 18, 49, 50, 21, 22, 46, 23, 8, 24, 26, 4, 29, 30, 31, 36, 5, 37, 16, 39, 1, 41, 43, 3, 15, 19, 35, 47, 9, 40, 28, 2, 42]

puts Benchmark.measure { bubble_sort(array) }

p bubble_sort(array)
