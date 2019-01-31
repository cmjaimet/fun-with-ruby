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
    guess = gets.chomp.to_in
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

# Good morning,
#
# I would like to submit my resume for your consideration. I am currently the head of CMS development (WordPress) at Postmedia, responsible for sites like the Ottawa Citizen and the National Post.
#
# For the past six years, my user base has consisted of large, high-volume newsrooms, and my audiences have covered two thirds of the Canadian population. I have led several successful initiatives to extend the WordPress CMS, migrate content to scalable and performant NoSQL data stores on AWS, and worked closely with sales and product teams to drive engagement and grow revenue.
#
# I lead eight teams of software engineers and report to the SVP Product Development as a member of the senior product team.
#
# While I don't see that you are actively hiring at the moment, I hope that you will consider my experience and skills and see me as a valuable addition to your company.
#
# I look forward to hearing back from you at your convenience.
#
# https://www.linkedin.com/in/charles-jaimet/
