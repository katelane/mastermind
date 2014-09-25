gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game'

class GameTest < Minitest::Test

  def secret_sequence
    @secret_sequence
  end

  def max_turns_reached
    @turns == 11
  end

  def not_a_valid_letter?
    guess = "rbgg"
  end
  
end
