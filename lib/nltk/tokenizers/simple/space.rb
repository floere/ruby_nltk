module NLTK::Tokenizers::Simple

  # A tokenizer that divides a string into substrings by treating any
  # single whitespace character as a separator.  If you are performing
  # the tokenization yourself (rather than building a tokenizer to
  # pass to some other piece of code), consider using the String#split
  # method instead:
  #
  # Example:
  #   words = s.split(/\s/)
  #
  class Space < String

    def initialize
      super(/\s/)
    end

  end

end