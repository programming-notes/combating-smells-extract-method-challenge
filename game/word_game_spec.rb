require_relative "word_game"

describe WordGame do
	let(:game) { WordGame.new("word") }

	it "checks the player guess" do
		expect(game.check_guess("w")).to eq "w???"
	end

	# it "checks if the player wins" do
		
	# end
end