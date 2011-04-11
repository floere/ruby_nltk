module NLTK::Tokenizers::Simple

  # A tokenizer that divides a string into substrings by treating any
  # single tab character as a separator.  If you are performing the
  # tokenization yourself (rather than building a tokenizer to pass to
  # some other piece of code), consider using the String#split
  # method instead:
  #
  # Example:
  #   words = s.split(/\t/)
  #
  # Note: As opposed to the Python variant, the Ruby one does not
  #       generate a '' token if the last character is a newline.
  #
  class Line < String

    def initialize blank_lines = {}
      super(/\n/)
      @discard_blank_lines = blank_lines[:discard]
    end

    def tokenize text
      tokenized = super text
      tokenized.select! { |line| line !~ /\A\s*\Z/ } if @discard_blank_lines
      tokenized
    end

  end

end