# encoding: utf-8
#
require 'spec_helper'

describe NLTK::Tokenizers::Simple::Char do
  
  let(:tokenizer) { described_class.new }
  
  describe 'tokenize' do
    it 'tokenizes correctly' do
      tokenizer.tokenize("abcdefgh").should == ['a','b','c','d','e','f','g','h']
    end
    it 'tokenizes correctly' do
      tokenizer.tokenize("   ").should == [' ',' ',' ']
    end
  end
  
end