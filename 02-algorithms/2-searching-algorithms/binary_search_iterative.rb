oneMillion = []
i = 1
while i <= 1000000
  oneMillion.push(i)
  i += 1
end

def binary_search_iterative(array, element)
  current = array.length / 2
  low = array.first
  high = array.last
  iteration = 1
  if element < low || element > high
    puts "That element is not in the array."
    return
  else
    until array[current] == element || high < low
      if array[current] > element
        high = current
        current = (high + low) / 2
      elsif array[current] < element
        low = current
        current = (high + low) / 2
      end
      iteration += 1
    end
  end
  puts "The element #{element} is at index #{current}. It took #{iteration} iterations to find the element."
end

binary_search_iterative(oneMillion, 5000000)
