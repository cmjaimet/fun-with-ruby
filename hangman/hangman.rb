class Hangman
  attr_reader :answer_text, :answer_letters, :guessed_letters, :game_over

  def initialize( answer )
    @answer_text     = input_answer_text( "Enter the answer text", answer )
    @answer_letters  = []
    @guessed_letters = []
    @game_over       = false
  end

  def play()
    answer_letters = get_answer_letters( answer_text )
    # system "clear" or system "cls"
    puts "Okay, let's play"
    while ! game_over do
      do_turn
    end
  end

  def do_turn()
    puts answer_text
    letter = false
    while false == letter do
      letter = input_guess_text( "Guess a letter" )
    end
    add_guessed_letter( letter )
    puts guessed_letters
  end

  def add_guessed_letter( letter )
    guessed_letters.push( letter )
    guessed_letters.sort
  end

  def input_guess_text( msg )
    txt = validate_guess_text( format_input( get_input( msg ) ) )
  end

  def validate_guess_text( letter )
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

  def get_input( msg )
    puts msg
    gets.chomp
  end

  def format_input( txt )
    txt.upcase!.strip!
    if txt.include? " "
      return txt.split(" ").join(" ")
    end
    return txt
  end

  def input_answer_text( msg, txt )
    if "" != txt
      txt = validate_answer_text( format_input( txt ) )
    end
    while "" == txt do
      txt = validate_answer_text( format_input( get_input( msg ) ) )
    end
    return txt
  end

  def validate_answer_text( txt )
    if txt.length < 3 or ! ( /[^A-Z ]/ =~ txt ).nil?
      return ""
    end
    return txt
  end

  def get_answer_letters( txt )
    txt = txt.gsub( ' ', '' )
    letters = txt.split('')
    return letters.uniq.sort
  end

  def game_over()
    false # replace later with wrong guess counter and answer complete assessor
  end

end
