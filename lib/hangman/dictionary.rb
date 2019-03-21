module Hangman
  module Dictionary
    WORDS = IO.readlines("linuxwords").select{|word| word.length > 5}
   
    def self.random
      WORDS.sample.chomp
    end
  end
end