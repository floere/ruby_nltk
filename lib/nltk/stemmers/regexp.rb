module NLTK
  module Stemmers

    # A stemmer that uses regular expressions to identify morphological
    # affixes.  Any substrings that match the regular expressions will
    # be removed.
    #
    class Regexp

      def initialize regexp, min = 0
        @regexp = regexp
        @min    = min
      end

      #
      #
      def stem word
        word.size < @min ? word : word.sub(@regexp, '')
      end

    end

  end
end