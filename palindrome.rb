print "Present your potential palindrome: "
inp = gets.chomp.downcase
if inp == inp.reverse
  puts "Nice work! '#{inp}' is a palindrome. (And so is '#{inp.reverse}')"
else
  puts "Hmm... '#{inp}'' backwards is '#{inp.reverse}', not '#{inp}'. Try again."
end
