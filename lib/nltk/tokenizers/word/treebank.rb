module NLTK::Tokenizers::Word

  # A word tokenizer that tokenizes sentences using the conventions
  # used by the Penn Treebank.  Contractions, such as "can't", are
  # split in to two tokens.
  #
  # Examples:
  #  * can't S{->} ca n't
  #  * he'll S{->} he 'll
  #  * weren't S{-} were n't
  #
  # This tokenizer assumes that the text has already been segmented into
  # sentences.  Any periods -- apart from those at the end of a string --
  # are assumed to be part of the word they are attached to (e.g. for
  # abbreviations, etc), and are not separately tokenized.
  #
  class Treebank

    # List of contractions adapted from Robert MacIntyre's tokenizer.
    CONTRACTIONS2 = [/(?i)(.)('ll|'re|'ve|n't|'s|'m|'d)\b/,
                     /(?i)\b(can)(not)\b/,
                     /(?i)\b(D)('ye)\b/,
                     /(?i)\b(Gim)(me)\b/,
                     /(?i)\b(Gon)(na)\b/,
                     /(?i)\b(Got)(ta)\b/,
                     /(?i)\b(Lem)(me)\b/,
                     /(?i)\b(Mor)('n)\b/,
                     /(?i)\b(T)(is)\b/,
                     /(?i)\b(T)(was)\b/,
                     /(?i)\b(Wan)(na)\b/]
    CONTRACTIONS3 = [/(?i)\b(Whad)(dd)(ya)\b/,
                     /(?i)\b(Wha)(t)(cha)\b/]

    def tokenize text
      CONTRACTIONS2.each do |regexp|
        text = text.gsub regexp, '\1 \2'
      end
      CONTRACTIONS3.each do |regexp|
        text = text.gsub regexp, '\1 \2 \3'
      end

      # Separate most punctuation.
      #
      text = text.gsub /([^\w\.\'\-\/,&])/, ' \1 '

      # Separate commas if they're followed by space.
      # (E.g., don't separate 2,500)
      #
      text.gsub! /(,\s)/, ' \1'

      # Separate single quotes if they're followed by a space.
      #
      text.gsub! /('\s)/, ' \1'

      # Separate periods that come before newline or end of string.
      #
      text.gsub! /\. *(\n|$)/, ' . '

      text.split
    end
  end

end