require 'benchmark'

def selection_sort(collection)
   length = collection.length
   # #1
   for i in 0..length - 2
     # #2
     min_index = i
     # #3
     for j in (i + 1)...length
       if collection[j] < collection[min_index]
         # #4
         min_index = j
       end
     end

     # #5
     tmp = collection[i]
     collection[i] = collection[min_index]
     collection[min_index] = tmp
   end
   collection
 end

 array = [12, 33, 7, 20, 44, 10, 13, 25, 27, 11, 6, 48, 14, 17, 38, 45, 34, 32, 18, 49, 50, 21, 22, 46, 23, 8, 24, 26, 4, 29, 30, 31, 36, 5, 37, 16, 39, 1, 41, 43, 3, 15, 19, 35, 47, 9, 40, 28, 2, 42]

 puts Benchmark.measure { selection_sort(array) }

 p selection_sort(array)
