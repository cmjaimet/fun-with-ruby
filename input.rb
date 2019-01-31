# Amazing magic trick - guess a number wrong every time

def get_answer( min, max, guess )
  answers = ( min..max ).to_a
  answers.delete_at( guess - 1 )
  answers[ rand( max - min ) ]
end

def get_guess( min, max )
  guess = 0
  while 0 == guess
    print "Pick a number between #{min} and #{max}: "
    guess = gets.chomp.to_i
    if min > guess or max < guess
      guess = 0
    end
  end
  guess
end

min = 1
max = 10
guess = get_guess( min, max )
answer = get_answer( min, max, guess )

# puts "You guessed #{guess}"
puts "Wrong! The correct number is: #{answer}"
