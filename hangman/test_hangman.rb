require_relative "hangman"
require "test/unit"

class TestHangman < Test::Unit::TestCase

  def setup
    @game1 = Hangman.new(' everything is  connected ')
  end

  def test_input_answer_text
    assert_equal( "EVERYTHING IS CONNECTED", @game1.answer_text )
    assert_equal( "D G", Hangman.new( 'd g' ).answer_text )
    assert_equal( "DOG", Hangman.new( 'dog' ).answer_text )
    assert_equal( "DOG", Hangman.new( ' dog ' ).answer_text )
  end

  def test_validate_answer_text
    assert_equal( "SMELL THE ROSES", @game1.validate_answer_text( 'SMELL THE ROSES' ) )
    assert_equal( "", @game1.validate_answer_text( 'smell the  roses' ) )
    assert_equal( "", @game1.validate_answer_text( 'free 2B me!' ) )
    assert_equal( "", @game1.validate_answer_text( 'IF' ) )
    assert_equal( "", @game1.validate_answer_text( '' ) )
  end

  def test_answer_letters
    assert_equal( [ "E", "H", "L", "M", "O", "R", "S", "T" ], @game1.get_answer_letters( 'SMELL THE ROSES' ) )
    assert_equal( [ "D", "G", "O" ], @game1.get_answer_letters( 'DOG' ) )
    assert_equal( [ "D", "E", "G", "H", "O", "T" ], @game1.get_answer_letters( 'THE DOG' ) )
  end

  def test_validate_guess_text
    assert_equal( 'A', @game1.validate_guess_text( 'A' ) )
    assert_equal( 'B', @game1.validate_guess_text( 'B' ) )
    assert_equal( false, @game1.validate_guess_text( ' A ' ) )
    assert_equal( false, @game1.validate_guess_text( '1' ) )
    assert_equal( false, @game1.validate_guess_text( ' ' ) )
    assert_equal( false, @game1.validate_guess_text( '.' ) )
    assert_equal( false, @game1.validate_guess_text( 'a' ) )
    assert_equal( false, @game1.validate_guess_text( 'AP' ) )
  end

end
