def fizzbuzz( min, max, opts = {} )
  ( min..max ).each do |num|
    out = num.to_s
    opts.keys.each do |key|
      if 0 == num % key
        out += ' ' + opts[ key ]
      end
    end
    puts out
  end
end

fizzbuzz( 3, 30, {
  2 => 'fizz',
  3 => 'buzz',
  5 => 'splat'
} )
