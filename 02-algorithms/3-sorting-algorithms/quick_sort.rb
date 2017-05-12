require 'benchmark'

def quick_sort(collection)
  pivot = collection.last
  i = 0
  while collection[i] != pivot
    if collection[i] > pivot
      movingElement = collection.delete_at(i)
      new_index = collection.index(pivot) + 1
      collection.insert(new_index, movingElement)
    else
      i += 1
    end
  end
  pivot_index = collection.index(pivot)
  leftArray = collection[0..pivot_index - 1]
  rightArray = collection[pivot_index + 1..collection.length - 1]
  unless leftArray.length <= 1
    quick_sort(leftArray)
  end
  unless rightArray.length <= 1
    quick_sort(rightArray)
  end
  result = []
  leftArray.each do |a|
    result.push(a)
  end
  result.push(pivot)
  rightArray.each do |b|
    result.push(b)
  end
  result
end

array = [12, 33, 7, 20, 44, 10, 13, 25, 27, 11, 6, 48, 14, 17, 38, 45, 34, 32, 18, 49, 50, 21, 22, 46, 23, 8, 24, 26, 4, 29, 30, 31, 36, 5, 37, 16, 39, 1, 41, 43, 3, 15, 19, 35, 47, 9, 40, 28, 2, 42]

puts Benchmark.measure { quick_sort(array) }

p quick_sort(array)
