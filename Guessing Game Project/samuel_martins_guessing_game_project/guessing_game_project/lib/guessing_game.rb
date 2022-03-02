class GuessingGame

    def initialize(min, max)
        @min = min
        @max = max
        @secret_num = rand(@min..@max)
        @num_attempts = 0
        @game_over = false
    end

    def num_attempts
        @num_attempts
    end

    def game_over?
        @game_over
    end

    def check_num(number)
        if @secret_num == number
            puts "you win"
            /win/
            @game_over = true 
        elsif @secret_num < number
            puts "too big"
            /big/
        else  
            puts "too small"
            /small/
        end
        @num_attempts += 1
    end

    def ask_user
        puts "enter a number"
        number = gets.chomp 
        check_num(number.to_i)
    end


end
