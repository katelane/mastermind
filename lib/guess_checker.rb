class GuessChecker

 # attr_reader :guess, :secret_sequence  # => nil
 #
 #   def initialize
 #     @guess = guess                      # => nil
 #     @secret_sequence = secret_sequence  # => nil
 #   end

#   compare colors to those within the secret sequence array
  def correct_colors(guess, secret_sequence)
    counter = 0
    secret_dup = secret_sequence.dup
    guess.each do |element|
      if secret_dup.include?(element)
        element_index = secret_dup.index(element)
        secret_dup.slice!(element_index)
        counter +=1
      end
    end
    counter
  end

#   compare index locations with x enumerable.
  def correct_pos(guess, secret_sequence)
    guess.each_with_index.count do |color, index_pos|  # => #<Enumerator: ["y", "b", "b", "g"]:each_with_index>
       color == secret_sequence[index_pos]             # => false, false, false, false
     end                                               # => 0
  end

#  note: if i want to save the guesses and store them as arrays
#   for like a display board later, i'll have to use an
#   enum that creates and stores new arrays 1-10, like map or dup (right?)
# history << guess - history class shovels guesses as strings into a giant multi-d array
# rounds... interesting.

end
