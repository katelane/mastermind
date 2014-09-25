require './lib/game'
class MessagePrinter
  def intro
    puts "Welcome to Mastermind."
    program_instructions
  end

  def program_instructions
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def command_request
    print "Enter your command: "
  end

  def game_instructions
    puts "Welcome to Mastermind. The computer is the codemaker, the player is the codebreaker.
      The computer will choose a secret sequence of four colors. The player must guess the sequence in ten turns.
      The player can guess any 4-element combinations of (r)ed, (g)reen, (b)lue and (y)ellow (ex. GYBB).
      It’s possible that the computer might use a single color for the entire sequence (ex. RRRR).
      After each guess, the computer will inform the player whether any colors within the guess are the right color and in the right position.
      You are limited to ten guesses. See if you can crack the code!
      Good luck!"
  end

  def ending
    puts "Goodbye."
  end

  def game_intro
    puts "I have generated a beginner sequence from four elements, a mix that may include
    (r)ed, (g)reen, (b)lue, and/or (y)ellow. Use (q)uit at any time to end the game."
  end

  def turn_indicator(turns)
    if turns == 0
      puts "You've made 0 successful guesses."
    elsif
      turns == 1
      puts "You've made 1 successful guess."
    elsif
      turns == 9
      puts "You've made 9 successful guesses. You have only one left..."
    else
      puts "You've made #{turns} successful guesses."
    end
  end

  def max_turns_reached(secret_sequence)
      puts "You have used up all your turns. The secret sequence was #{secret_sequence}. Game over."
      program_instructions

  end

  def game_command_request
    print "Enter your guess: "
  end

  def game_quit
    puts "Exiting the game."
    program_instructions
  end

  def game_win(secret_sequence, turns, start_time)
    game_length = (Time.now - start_time).to_i
    minutes = game_length / 60
    seconds = game_length % 60
    puts "Congratulations! You guessed the sequence #{secret_sequence} in #{turns} guesses in #{minutes} minutes and #{seconds} seconds."
    puts "Do you want to (p)lay again or (q)uit?"
  end

  def nice_try(command, correct_colors, correct_pos)
    puts "#{command} uses #{correct_colors} of the correct elements with #{correct_pos} in the correct position."
  end

  def not_a_valid_letter
    puts "Your guess includes something other than R, G, B or Y. Try again."
  end

  def not_four
    puts "Your guess must be exactly four letters. Try again."
  end

  def not_a_valid_command
    if command = "q" || "quit"
      puts "Thanks for playing."
      exit
    else
    puts "That's not a valid command."
    end
  end

end
