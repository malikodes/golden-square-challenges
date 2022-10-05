class GrammarStats
    def initialize(text)
      # ...
       @text = text 
       @valid_punctuation = /[".","?","!"]/
    end
  
    def check(text) # text is a string
      # Returns true or false depending on whether the text begins with a capital
      # letter and ends with a sentence-ending punctuation mark.
        fail "No valid content to check" if text.empty? 
        if text[0] == text[0].upcase && text[-1] =~ @valid_punctuation
            return true
        else 
            false
        end
    end
  
    def percentage_good
      # Returns as an integer the percentage of texts checked so far that passed
      # the check defined in the `check` method. The number 55 represents 55%.

        if @text == ""
            return 0
        else 
            # @text_arr = @text.split(Regexp.union([".","?","!"])) >> Regex split excludes delimiters
            @text_arr = @text.split(/(?<=[?.!])/) 
            # ^ Regex split includes delimiters. Positive lookbehind regular expression (i.e. ?<=) inside a parenthesis capture group to keep the delimiter at the end of each string
            p @text_arr
            @valid_text = @text_arr.filter {|text_snippet| check(text_snippet.strip) }
            return (@valid_text.length / @text_arr.length.to_f) * 100
        end
    end

  end