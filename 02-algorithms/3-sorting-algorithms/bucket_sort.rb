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


def bucket_sort(collection, numberOfBuckets)
  highestNumber = 0
  for i in collection
    if i > highestNumber
      highestNumber = i
    end
  end
  bucketSize = (highestNumber / numberOfBuckets)
  buckets = []
  currentBucket = 0
  while currentBucket < numberOfBuckets
    buckets << []
    currentBucket += 1
  end
  iteration = 1
  while iteration <= numberOfBuckets
    collection.each do |n|
      if iteration == 1 && n <= (bucketSize * iteration)
        buckets[(iteration - 1)] << n
      elsif n <= (bucketSize * iteration) && n > (bucketSize * (iteration - 1))
        buckets[(iteration - 1)] << n
      end
    end
    iteration += 1
  end
  result = []
  buckets.each do |j|
    if j.length == 1
      result.push(j[0])
    elsif j.length > 1
      sorted = insertion_sort(j)
      sorted.each do |k|
        result.push(k)
      end
    end
  end
  result
end

array = [12, 33, 7, 20, 44, 10, 13, 25, 27, 11, 6, 48, 14, 17, 38, 45, 34, 32, 18, 49, 50, 21, 22, 46, 23, 8, 24, 26, 4, 29, 30, 31, 36, 5, 37, 16, 39, 1, 41, 43, 3, 15, 19, 35, 47, 9, 40, 28, 2, 42]

puts Benchmark.measure { bucket_sort(array, 5) }

p bucket_sort(array, 5)
