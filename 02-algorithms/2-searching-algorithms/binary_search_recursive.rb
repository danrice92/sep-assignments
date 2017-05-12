oneMillion = []
i = 1
while i <= 1000000
  oneMillion.push(i)
  i += 1
end

@current = oneMillion.length / 2
@low = oneMillion.first
@high = oneMillion.last
@iteration = 1

def binary_search_recursive(array, element)
  if element < @low || element > @high
    puts "That element is not in the array."
    return
  else
    if array[@current] == element
      puts "The element #{element} is at index #{@current}. It took #{@iteration} iterations to find the element."
      return
    elsif array[@current] > element
      @high = @current
      @current = (@high + @low) / 2
      @iteration += 1
      binary_search_recursive(array, element)
    elsif array[@current] < element
      @low = @current
      @current = (@high + @low) / 2
      @iteration += 1
      binary_search_recursive(array, element)
    end
  end
end

binary_search_recursive(oneMillion, 500000)
