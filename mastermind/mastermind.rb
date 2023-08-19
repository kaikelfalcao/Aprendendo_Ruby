class Mastermind

    def play
        puts "Welcolme to the game \n\nAre you a MasterMind?\n\n"

        number = rand(1000..10000)
        
        print "Guess the 4 digits number: "
        guessed_number = gets.chomp.to_i

        if number == guessed_number
            puts "You guessed the number in just 1 try! You're a Mastermind!"
        else
            counter = 0 

            while(number != guessed_number)

                counter +=1
                
                correct_numbers = 0
                correct = ['x'] * 4

                number_digits = number.digits.reverse
                guessed_digits = guessed_number.digits.reverse

                for i in 0...4
                    if number_digits[i] == guessed_digits[i]
                        correct_numbers += 1
                        correct[i] = number_digits[i]
                    end
                end

                if correct_numbers == 0
                    puts "None of the numbers in your input match."
                    print "Guess more 4 digits number: "
                    guessed_number = gets.chomp.to_i
                end

                puts "Not quite the number. But you did get #{correct_numbers} digit(s) correct!"
                puts "Also these numbers in your input were correct: #{correct.join(' ')}"
                puts
                
                print "Guess more 4 digits number: "
                guessed_number = gets.chomp.to_i

                
            end

            if number == guessed_number
                puts "You've become a Mastermind!"
                puts format("It took you only %s tries",counter)
            end
        end
    end
end

game = Mastermind.new

game.play