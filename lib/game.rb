class Game
  attr_reader :guess,         # => :guess
              :turns,         # => :turns
              :printer,       # => :printer
              :command,       # => :command
              :guess_checker  # => nil

  def initialize(printer = MessagePrinter.new)
    @guess         = 0
    @turns         = 0
    @printer       = printer
    @command       = ""
    @guess_checker = GuessChecker.new
    @start_time    = Time.now
  end

  def secret_sequence
    @secret_sequence ||= generate_secret_sequence
  end

  def generate_secret_sequence
    colors = ['R', 'Y', 'G', 'B']
    @secret_sequence = []
    4.times do
      @secret_sequence << colors.sample
    end
    @secret_sequence
  end

  def play
    printer.game_intro
    puts secret_sequence
    until win? || exit? || max_turns_reached?
      printer.turn_indicator(turns)
      printer.game_command_request
      @command = gets.strip
      @guess   = command.upcase.split("")
#      store_history
      process_game_turn
    end
  end

  private  # => Game

  def process_game_turn
    return if exit?
    correct_colors = guess_checker.correct_colors(guess, secret_sequence)
    correct_pos    = guess_checker.correct_pos(guess, secret_sequence)
#    puts store_history
    case
    when not_four?
        printer.not_four
    when not_a_valid_letter?
      printer.not_a_valid_letter
    when nice_try?
      printer.nice_try(guess, correct_colors, correct_pos)
      add_turn
    end
    printer.max_turns_reached(secret_sequence) if max_turns_reached?
    printer.game_win(secret_sequence, turns) if win?
  end

#  def store_history
#    history = []
#    history << guess
#  end

  def add_turn
    @turns += 1
  end

  def max_turns_reached?
    @turns == 10
  end

  def nice_try?
    !not_four? && !not_a_valid_letter?
  end

  def not_a_valid_letter?
    guess.join('').scan(/[^RGBYQ]/).count > 0 || not_four?
  end

  def not_four?
    guess.length != 4
  end

  def win?
    guess == secret_sequence
#    @timer = Time.now - @start_time
  end

  def exit?
    command == "q" || command == "quit"
  end
end
