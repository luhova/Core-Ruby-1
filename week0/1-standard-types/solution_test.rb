require 'minitest/autorun'

require_relative 'solution'

class SolutionTest < Minitest::Unit::TestCase
  def test_histogram
    assert_equal  histogram("abraca"),  {"a"=>3, "b"=>1, "r"=>1, "c"=>1}
  end

  def test_prime?
  	assert_equal prime?(7) , true
  end

  def test_ordinal
  	assert_equal ordinal(2), "2nd"
  end

  def test_palindrome?
  	assert_equal palindrome?(12321), true
  end

  def test_anagram?
    assert_equal anagram?('listen', 'silent'), true
  end

  def test_digits?
    assert_equal digits(12345), [1, 2, 3, 4, 5]
  end

  def test_fizzbuzz
    assert_equal fizzbuzz(1..7), [1, 2, :fizz, 4, :buzz, :fizz, 7]
  end

  def test_count
    assert_equal count( [1, 2, 3, 1] ), {1=>2, 2=>1, 3=>1}
  end

  def test_count_words
    assert_equal count_words "This is a sentence, bro.", "Bro, this is it." , {"this"=>2, "is"=>2, "a"=>1, "bro"=>2, "it"=>1, "sentence"=>1}
  end
end


