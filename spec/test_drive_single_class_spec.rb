require 'test_drive_single_class'

RSpec.describe GrammarStats do
    context "when string is empty" do
        it "returns false" do
            sample_text = GrammarStats.new("")
            expect{(sample_text.check(""))}.to raise_error "No valid content to check"
        end

        it "returns 0" do
            sample_text = GrammarStats.new("")
            expect(sample_text.percentage_good).to eq 0
        end
    end

    context "when given a valid string" do
        it "returns true when text starts with uppercase" do
            sample_text = GrammarStats.new("They love chocolate.")
            expect(sample_text.check("They love chocolate.")).to eq true
        end

        it "returns true when text ends with a dot" do
            sample_text = GrammarStats.new("They love chocolate.")
            expect(sample_text.check("They love chocolate.")).to eq true
        end

        it "returns true when text ends with a exclamation mark" do
            sample_text = GrammarStats.new("They love chocolate!")
            expect(sample_text.check("They love chocolate!")).to eq true
        end

        it "returns true when text ends with a question mark" do
            sample_text = GrammarStats.new("Do they love chocolate?")
            expect(sample_text.check("Do love chocolate?")).to eq true
        end

        it "returns 100 when whole text passes check " do
            sample_text = GrammarStats.new("Do they love chocolate?")
            expect(sample_text.percentage_good).to eq 100
        end

    end

    context "when given invalid string" do
        it "returns false when text starts with lowercase" do
            sample_text = GrammarStats.new("they love chocolate.")
            expect(sample_text.check("they love chocolate.")).to eq false
        end

        it "returns false when text doesn't end with sentence-ending punctuation" do
            sample_text = GrammarStats.new("They love chocolate")
            expect(sample_text.check("They love chocolate")).to eq false
        end

        it "returns false when text doesn't end with sentence-ending punctuation" do
            sample_text = GrammarStats.new("they love chocolate,")
            expect(sample_text.check("they love chocolate,")).to eq false
        end

        it "returns 50 when half of the text is valid" do
            sample_text = GrammarStats.new("The weather is nice. what do you think?")
            expect(sample_text.percentage_good).to eq 50
        end
    end

end