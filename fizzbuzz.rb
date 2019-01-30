def fizzbuzz( min = 0, max = 100, opts = {} )
  range = validate_range( min, max )
  opts  = validate_opts( opts )
  range.each do |num|
    out = num.to_s
    opts.keys.each do |key|
      if 0 == num % key
        out += ' ' + opts[ key ]
      end
    end
    puts out
  end
end

def validate_range( min, max )
  min = min.to_i
  max = max.to_i
  if min >= max
    max = min + 1
  end
  range = min..max
  return range
end

def validate_opts( opts )
  def_opts = {
    2 => 'fizz',
    3 => 'buzz'
  }
  if ! opts.is_a?( Hash )
    return def_opts
  end
  opts.delete_if{ | key, val| ! key.is_a?( Integer ) }
  if opts.empty?
    return def_opts
  end
  return opts
end




fizzbuzz( -10, 10, {
  2 => 'fizz',
  3 => 'buzz',
  5 => 'splat'
} )

puts ''

fizzbuzz( 3, 15, 'dog' )

puts ''

fizzbuzz( -10, 10, {
  2 => 'fizz',
  'dog' => 'buzz',
  5 => 'splat'
} )

puts ''

fizzbuzz( 0, 10, {
  'dog' => 'buzz'
} )
