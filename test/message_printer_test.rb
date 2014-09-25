gem 'minitest', '~> 5.2'                   # => true
require 'minitest/autorun'                 # => true
require 'minitest/pride'                   # => true
require_relative '../lib/message_printer'  # => true

class MessagePrinterTest < Minitest::Test

  def entry_of_invalid_length
    guess = ["b","g","r"]
    message_printer = MessagePrinter.new
    assert_equal puts_four
  end

  def entry_of_invalid_chars
    guess = ["b","x","r","a"]
    message_printer = MessagePrinter.new
    assert_equal not_a_valid_letter
  end
end

# >> Run options: --seed 45814
# >>
# >> # Running:
# >>
# >>
# >>
# >> [31mF[0m[32ma[0m[33mb[0m[34mu[0m[35ml[0m[36mo[0m[31mu[0m[32ms[0m[33m [0m[34mr[0m[35mu[0m[36mn[0m in 0.000841s, 0.0000 runs/s, 0.0000 assertions/s.
# >>
# >> 0 runs, 0 assertions, 0 failures, 0 errors, 0 skips
