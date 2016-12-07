class WordGame
	attr_accessor :word
	attr_reader :guess_count, :is_over
	
	def initialize(word)
		@correct_word = word
		@guessed_word = []
		@wrong_guesses = []
		@guess_count = word.length / 2
	    @is_over = false
	    p "Great! let the guessing game, Begin!"
	    @correct_word.chars.each_index {|index| @guessed_word[index] = "?"}
	    
	end
	
	def check_guess(guessed_letter)
		# what this was supposed to do is iteriate through @guessed_word
		# whenever the player makes a correct guess the "?" is replaced with
		# the letter in the correct spot. Ex. "word" game.check_guess("w") "w???"
		# and if the guess was incorrect it would put it in an array of incorrect guesses
		
		# bugs:
		# 1. if a word has more than one same letter it only prints out one of however many there are
		#    ex. "jeremy"  game.check_guess("e") "?e????" when it should be "?e?e??"
		@correct_word.each_with_index do |letter,index|
			if @correct_word.include?(guessed_letter) == true
				swap_index = @correct_word.index(guessed_letter)
				@guessed_word[swap_index] = guessed_letter
			elsif @correct_word.include?(guessed_letter) == false
				@wrong_guesses << guessed_letter
			end
		end
		if @correct_word.include?(guessed_letter) == true
				puts "Nice Job!"
		elsif @correct_word.include?(guessed_letter) == false
			@guess_count -= 1
			puts "Sorry, try again!"
		end
		puts @guessed_word.join("")
		puts "wrong guesses:#{@wrong_guesses.join(",")}"
	end
	
	def did_player_win
		if @guess_count == 0 && @guessed_word.join("") != @correct_word
			@is_over = true
			puts "Sorry you lose, maybe next time."
		elsif @guessed_word.join("") == @correct_word
			@is_over = true
			puts "Yay! You win!"
		else
			false
		end
	end
end

puts "Welcome to our word-guessing game!"
puts "Please input a word for someone to guess."

word = gets.chomp
game = WordGame.new(word)

while !game.is_over
	puts "---------------"
	puts "Make a guess!"
	guessed_letter = gets.chomp
	game.check_guess(guessed_letter)
	game.did_player_win
end