require 'rspec'

def script(word)
    result = if word.downcase.end_with?("cs")
		 puts(2.pow(word.length.to_i))
	     else
		 puts(word.reverse)
	     end
    print result
end

puts('Enter word: ')
word = gets.chomp

script(word)

RSpec.describe "Main" do
    it "#script" do
        word = "abcd"
        expect(script("abcd")).to eq("dcba")
    end
    it "#script" do
    	word = "abcdcs"
        expect(script("abcdcs")).to eq("64")
    end
    it "#script" do
    	word = "aBdCs"
        expect(script("aBdCs")).to eq("32")
    end
    it "#script" do
    	word = "ABCS"
        expect(script("ABCS")).to eq("16")
    end
    it "#script" do
        word = "CsAb"
        expect(script("CsAb")).to eq("bAsC")
    end
end
