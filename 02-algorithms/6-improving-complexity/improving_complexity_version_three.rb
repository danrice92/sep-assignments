# Create a version that improves the space complexity. Put the solution in a file named improving_complexity_version_three.rb.

# I attempted to improve the space complexity by using a space-efficient while loop and deleting elements that had already been sorted rather than keeping them in array that would take up more memory. This implementation was detrimental to time performance, but should mean it uses the least space.

require 'benchmark'

def space_conscious_ruby(*arrays)
  combined_array = []
  arrays.each do |array|
    array.each do |value|
      combined_array << value
    end
  end
  while combined_array.length > 0
    lowestValue = combined_array[0]
    combined_array.each do |val|
      if val < lowestValue
        lowestValue = val
      end
    end
    puts combined_array.delete(lowestValue)
  end
end

firstArray = [87, 2, 5, 9, 13, 1, 93, 33, 19, 81, 46, 88, 3, 6, 7, 91, 37]
secondArray = [22, 12, 99, 18, 84, 70, 55, 30, 72, 68, 11, 90, 5, 15, 21]

puts Benchmark.measure { space_conscious_ruby(firstArray, secondArray) }
