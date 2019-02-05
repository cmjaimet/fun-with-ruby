# for all the sums of numbers between 2..99 identify those that cannot also be derived as the sum of two primes
# get all primes between 2..99

def get_primes()
  numbers = {
    primes: [2],
    nonprimes: []
  }
  (3..99).each() do |num|
    is_prime = true
    numbers[:primes].each() do |prim|
      if 0 == num % prim
        is_prime = false
        break
      end
    end
    if is_prime
      numbers[:primes].push( num )
    else
      numbers[:nonprimes].push( num )
    end
  end
  numbers
end

def is_prime_sum?( allnums, sum )
  allnums[:primes].each() do |num1|
    if num1 >= sum
      break
    end
    allnums[:primes].each() do |num2|
      if num2 >= sum
        break
      end
      sum2 = num1 + num2
      if sum == sum2
        return false
      end
    end
  end
  return true
end

allnums = get_primes()
puts allnums[:primes]

allnums[:nonprimes].each() do |num1|
  allnums[:nonprimes].each() do |num2|
    sum = num1 + num2
    if is_prime_sum?( allnums, sum )
      puts "#{num1} + #{num2} = #{sum}"
    end
  end
end
