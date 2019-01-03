# Modify the String class by adding some silly new methods

class String

  # Add a synonym method for JavaScript folks
  def toUpperCase
    upcase
  end

  # This one is very silly
  def pig_latin
    words = []
    split( "\s" ).each do |word|
      max = word.length - 1
      pl_word = word[ (1..max) ] + '-' + word[0] + 'ay'
      words << pl_word
    end
    words.join( " " )
  end

end

# examples
phrase = "that dog is fat"
phrase.toUpperCase
phrase.pig_latin
