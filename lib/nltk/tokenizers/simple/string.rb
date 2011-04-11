module NLTK::Tokenizers::Simple

  # A tokenizer that divides a string into substrings by splitting
  # on the specified string.
  #
  class String

    attr_reader :splitter

    def initialize splitter
      @splitter = splitter
    end

    def tokenize text
      text.split splitter
    end

    # def span_tokenize text, &block
    #   text.span_tokenize &block
    # end

  end

end