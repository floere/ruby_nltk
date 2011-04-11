# encoding: utf-8
#
require 'spec_helper'

describe NLTK::Tokenizers::Word::Treebank do
  
  let(:tokenizer) { described_class.new }
  
  describe 'tokenize' do
    it 'tokenizes correctly' do
      tokenizer.tokenize("He wasn't a fool, but he wasn't a genius either.").should == [
        "He", "was", "n't", "a", "fool", ",", "but", "he", "was", "n't", "a", "genius", "either", "."
      ]
    end
    it 'tokenizes correctly' do
      tokenizer.tokenize("can't").should == ["ca", "n't"]
    end
    it 'tokenizes correctly' do
      tokenizer.tokenize("he'll").should == ["he", "'ll"]
    end
    it 'tokenizes correctly' do
      tokenizer.tokenize("weren't").should == ["were", "n't"]
    end
  end
  
end