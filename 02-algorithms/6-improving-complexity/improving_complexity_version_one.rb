# This method takes n arrays as input and combine them in sorted ascending order

# Create a version of the code above that has code optimizations. Put the solution in a file named improving_complexity_version_one.rb.

# I used benchmark to compare the performance of poorly_written_ruby before trying to improve it, then tried using the same two arrays of integers in my version, better_written_ruby. The first thing I noticed in poorly_written_ruby was that it iterates through both arrays to combine them together, then iterates through them again for every time it needs to insert a new element in the sorted, combined array it's supposed to return. Therefore, I thought the most important thing to do to optimize the code was to make it accomplish the same task in fewer iterations. I decided to remove the first iteration entirely that combines the two arrays into one, unsorted array, and just looped through both arrays to shovel the elements into a sorted array. Then, I used an if statement to avoid starting the while loop when the combined_array's length is 0, because I know that the first element will be inserted at combined_array[0].

# Performance was noticeably better according to Benchmark. Poorly_written_ruby scored .000056 or so, while better_written_ruby scored .000032 combining my two arrays of unsorted integers.


require 'benchmark'

def poorly_written_ruby(*arrays)
  combined_array = []
  arrays.each do |array|
    array.each do |value|
      combined_array << value
    end
  end
  sorted_array = [combined_array.delete_at(combined_array.length-1)]
  for val in combined_array
    i = 0
    while i < sorted_array.length
      if val <= sorted_array[i]
        sorted_array.insert(i, val)
        break
      elsif i == sorted_array.length - 1
        sorted_array << val
        break
      end
      i+=1
    end
  end
  sorted_array
end

def better_written_ruby(*arrays)
  combined_array = []
  arrays.each do |array|
    for val in array
      i = 0
      if combined_array.length == 0
        combined_array << val
      else
        while i < combined_array.length
          if val <= combined_array[i]
            combined_array.insert(i, val)
            break
          elsif i == combined_array.length - 1
            combined_array << val
            break
          end
          i+= 1
        end
      end
    end
  end
  combined_array
end

firstArray = [87, 2, 5, 9, 13, 1, 93, 33, 19, 81, 46, 88, 3, 6, 7, 91, 37]
secondArray = [22, 12, 99, 18, 84, 70, 55, 30, 72, 68, 11, 90, 5, 15, 21, 44, 39]

puts poorly_written_ruby(firstArray, secondArray)
puts Benchmark.measure { poorly_written_ruby(firstArray, secondArray) }

# puts better_written_ruby(firstArray, secondArray)
# puts Benchmark.measure { better_written_ruby(firstArray, secondArray) }
