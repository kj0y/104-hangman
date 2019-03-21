module Hangman
  class Game
    attr_reader :chances, :word, :wrong_tries, :guess

    def initialize
      @chances = 26 #change this back to 5
      @wrong_tries = 0
      @guess = ""
      @bad_guess = ""
      @word = Dictionary.random
    end

    def play
      Graphics.clear_screen
      puts 'Guess this word: ' + Graphics.obfuscate_word(word,'')
      puts word #delete this!!!
       

      while true
        print "[#{chances - wrong_tries} chances left]: "

        char = gets.chomp
        Graphics.clear_screen

      if char == ""
        puts "Please enter a letter."

      elsif char !~/\A[a-zA-Z'-]*\z/
        puts "Please enter a letter. Special characters and numbers are not allowed."
      
      elsif word.include? char

        if guess.include? char
            puts "You already entered '#{char}'. Yes, it is still correct.. 🙄"
            puts 'Try again: ' + Graphics.obfuscate_word(word, guess)
          else
            guess << char
            placeholder = Graphics.obfuscate_word(word, guess)

            puts 'Whoop Whoop!! ' + placeholder
          end
          unless placeholder.include? Graphics::OBFUSCATION_CHAR
            Graphics.clear_screen
            puts Graphics::ALIVE
            sleep 1
            Graphics.clear_screen
            puts Graphics::STAYINALIVE
            sleep 1
            Graphics.clear_screen
            puts Graphics::STILLALIVE
            sleep 1
            Graphics.clear_screen
            puts "\n\nWELL DONE!! YOU SURVIVED"
            break
          end
        else
          if @bad_guess.include? char
            puts "You've already guessed that, and it's still incorrect. Please try a new letter."
          else
            @bad_guess << char
            puts "OH NOES! The word doesn't contain '#{char}'"
            @wrong_tries = @wrong_tries + 1
          end
          if wrong_tries == chances
            puts Graphics::DEAD
            puts "\nARRRRGGGGGGGGGGG YOU LOST! 😭  😵  ☠️"
            break
          else
            puts 'Try another: ' + Graphics.obfuscate_word(word, guess)
          end
        end
      end
        rescue Interrupt
        Graphics.clear_screen
        puts "Goodbye, cruel world!"
    
    end
  end
end
