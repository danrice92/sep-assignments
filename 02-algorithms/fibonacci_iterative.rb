def fib(n)
  if n == 0
    return 0
  else
    i = 1
    fib_1 = 0
    fib_2 = 1
    while i < n
      temp = fib_2
      fib_2 = fib_1 + fib_2
      fib_1 = temp
      i+= 1
    end
    return fib_2
  end
end

puts fib(30)
