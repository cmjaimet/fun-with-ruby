# List the prime numbers in a range passed to the method (defaults to 3..100)

def primes( min=3, max=100 )
  min = min.to_i
  min = 3 if min<3
  max = max.to_i
  max = 100 if max<3
  max = min if max<min
  r = ( 3..max )
  p = [ 2 ]
  r.each do |num|
    is_prime = true
    p.each do |prim|
      if 0 == num % prim
        is_prime = false
        next
      end
    end
    p << num if is_prime
  end
  result = p.select do |prim|
    prim >= min
  end
  result
end

# examples

primes
primes( 14, 59 )
three_digit_primes = primes( 100, 1000 )
