# Create a version that improves the time complexity performance. Put the solution in a file named improving_complexity_version_two.rb.

# I initially struggled a bit to make timely_ruby perform consistently better than better_written_ruby. My first thought in changing the algorithm to improve performance was to use a binary sorting method to severely cut down on the number of iterations before inserting an element in its proper place, but I struggled with getting the right combination of statements that could minimize the number of iterations. Ultimately I used two elsif's in the beginning that took care of the scenario of combined_array.length equaling 1, and some edge cases where the new val is the highest or lowest element. Its performance is indeed faster, right around .000025 compared to .000032 with better_written_ruby sorting the same data set.

# Ultimately, this allowed me to reach the goal of significantly diminishing Big O time because timely_ruby cuts half of the remaining array out every time it iterates. The performance difference is minor in such a small set of data, but should be a significant improvement for large data sets.

require 'benchmark'

def timely_ruby(*arrays)
  combined_array = []
  arrays.each do |array|
    for val in array
      if combined_array.length == 0
        combined_array << val
      elsif val <= combined_array[0]
        combined_array.insert(0, val)
      elsif val > combined_array.last
        combined_array << val
      else
        low = 0
        high = combined_array.length - 1
        mid = (combined_array.length / 2).floor
        while low != high
          if val == combined_array[mid]
            combined_array.insert(mid, val)
            break
          elsif val < combined_array[mid] && val > combined_array[mid - 1]
            combined_array.insert(mid, val)
            break
          elsif val > combined_array[mid] && val < combined_array[mid + 1]
            combined_array.insert(mid + 1, val)
            break
          elsif val < combined_array[mid]
            high = mid
            mid = ((high + low) / 2).floor
          elsif val > combined_array[mid]
            low = mid
            mid = ((high + low) / 2).floor
          end
        end
      end
    end
  end
  combined_array
end

firstArray = [87, 2, 5, 9, 13, 1, 93, 33, 19, 81, 46, 88, 3, 6, 7, 91, 37]
secondArray = [22, 12, 99, 18, 84, 70, 55, 30, 72, 68, 11, 90, 5, 15, 21]

puts timely_ruby(firstArray, secondArray)

puts Benchmark.measure { timely_ruby(firstArray, secondArray) }
