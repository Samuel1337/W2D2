class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    DICTIONARY.sample
  end
  
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    (0...@secret_word.length).select { |i| @secret_word[i] == char }
  end

  def  fill_indices(char, matching_indices)
    matching_indices.each { |idx| @guess_word.fill(char, idx, matching_indices.length > 1 ? matching_indices.length-1 : matching_indices.length) }
  end

  def try_guess(char)
    array = get_matching_indices(char)
    if already_attempted?(char)
      puts "that has already been attempted"
      
      false
    else
      @attempted_chars << char
      array.length < 1 ? @remaining_incorrect_guesses -= 1 : fill_indices(char, array)
      true
    end
  end
  
  def ask_user_for_guess
    puts "Enter a char:'"

    input = gets.chomp
    try_guess(input)
  end

  def win? 
    if @guess_word.join == @secret_word
      puts "WIN"
      true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE" 
      true
    else
      false
    end
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      true
    else
      false
    end
  end
end