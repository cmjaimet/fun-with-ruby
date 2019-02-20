class Hangman
  attr_reader :answer_text, :answer_letters, :guessed_letters

  def initialize()
    @answer_text     = get_answer_text
    @answer_letters  = get_answer_letters
    @guessed_letters = []
  end

  def play()
    system "clear" or system "cls"
    puts "Okay, let's play"
    puts answer_letters
    while ! game_over do
      do_turn
    end
  end

  def game_over()
    false # replace later with wrong guess counter and answer complete assessor
  end

  def do_turn()
    letter = false
    while false == letter do
      puts "Guess a letter"
      letter = validate_guess( gets.chomp.upcase )
    end
    add_guessed_letter( letter )
    puts guessed_letters
  end

  def add_guessed_letter( letter )
    guessed_letters.push( letter )
  end

  def get_answer_letters()
    answer_letters = answer_text.split('')
    answer_letters.uniq!.sort
  end

  def validate_guess( letter )
    if ( 1 != letter.length or 65 > letter.ord or 90 < letter.ord )
      puts "That's not a single letter"
      return false
    end
    if ( guessed_letters.include?( letter ) )
      puts "You guessed that already"
      return false
    end
    return letter
  end

  def get_answer_text()
    puts "Enter Answer:"
    gets.chomp.upcase
  end

end

game = Hangman.new()
game.play
