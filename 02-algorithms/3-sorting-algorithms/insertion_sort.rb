require 'benchmark'

def insertion_sort(collection)
   # #1
   sorted_collection = [collection.delete_at(0)]

   for val in collection
     sorted_collection_index = 0
     # #2
     while sorted_collection_index < sorted_collection.length
       if val <= sorted_collection[sorted_collection_index]
         # #3
         sorted_collection.insert(sorted_collection_index, val)
         break
       elsif sorted_collection_index == sorted_collection.length - 1
         # #4
         sorted_collection.insert(sorted_collection_index + 1, val)
         break
       end

       sorted_collection_index += 1
     end
   end
   sorted_collection
 end

 array = [12, 33, 7, 20, 44, 10, 13, 25, 27, 11, 6, 48, 14, 17, 38, 45, 34, 32, 18, 49, 50, 21, 22, 46, 23, 8, 24, 26, 4, 29, 30, 31, 36, 5, 37, 16, 39, 1, 41, 43, 3, 15, 19, 35, 47, 9, 40, 28, 2, 42]

 puts Benchmark.measure { insertion_sort(array) }

 p insertion_sort(array)
