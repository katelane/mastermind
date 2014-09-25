gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess_checker'

class GuessCheckerTest < Minitest::Test

  def test_returns_number_of_matching_colors
    guess = ["b","y","r","g"]
    secret_sequence = ["b","g","r","r"]
    guess_checker = GuessChecker.new
    correct_colors = guess_checker.correct_colors(guess, secret_sequence)
    assert_equal 3, correct_colors
  end

  def test_returns_number_of_exact_matches
    guess = ["b","g","r","g"]
    secret_sequence = ["b","r","r","y"]
    guess_checker = GuessChecker.new
    correct_pos = guess_checker.correct_pos(guess, secret_sequence)
    assert_equal 2, correct_pos
  end

  def test_weird_thing
    secret_sequence = ["Y", "Y", "Y", "B"]
    guess_checker = GuessChecker.new
    correct_colors1 = guess_checker.correct_colors(["G", "G", "G", "G"], secret_sequence)
    assert_equal 0, correct_colors1
    correct_colors2 = guess_checker.correct_colors(["R", "R", "R", "R"], secret_sequence)
    assert_equal 0, correct_colors2
  end

  def test_duplicates
    guess = ["b","g","r","g"]
    secret_sequence = ["b","b","b","b"]
    guess_checker = GuessChecker.new
    correct_pos = guess_checker.correct_pos(guess, secret_sequence)
    assert_equal 1, correct_pos
  end

end
