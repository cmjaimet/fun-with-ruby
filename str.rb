str = "Why, what a jolly fellow you are!"

# str.split.each{ |w| puts w }
# str.split('').each{ |l| puts l.downcase }


letters = {}
str.split('').each{ |l|
  l = l.downcase
  if ('a'..'z').include?( l )
    if letters[ l ]
      letters[ l ] += 1
    else
      letters[ l ] = 1
    end
  end
}
puts letters
