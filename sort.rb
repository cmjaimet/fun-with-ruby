values = [ 'dog', 'mouse', 'owl', 'sparrow', 'larch', 'tuna', 'human', 'mosquito', 'whale', 'asparagus' ]
puts values
puts ''

puts values.sort
puts ''

puts values.sort{ |x, y| y <=> x }
puts ''

puts values.sort{ |x, y| x.length <=> y.length }
puts ''

puts values.collect{ |x| x.capitalize }
puts '... same as ...'
puts values.map{ |x| x.capitalize }
puts ''
