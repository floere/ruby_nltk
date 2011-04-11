# encoding: utf-8
#
require 'spec_helper'

describe NLTK::Tokenizers::Simple::Line do
  
  context 'discard blank lines' do
    let(:tokenizer) { described_class.new :discard => true }

    describe 'tokenize' do
      it 'tokenizes correctly' do
        tokenizer.tokenize("a\nb\n  \nc").should == ['a', 'b', 'c']
      end
      it 'tokenizes correctly' do
        tokenizer.tokenize("a\nb\n\n\nc\n").should == ['a', 'b', 'c']
      end
    end
  end
  
  context 'keep blank lines' do
    let(:tokenizer) { described_class.new :keep => true }

    describe 'tokenize' do
      it 'tokenizes correctly' do
        tokenizer.tokenize("a\nb\n  \nc").should == ['a', 'b', '  ', 'c']
      end
      it 'tokenizes correctly' do
        tokenizer.tokenize("a\nb\n\n\nc\n").should == ['a', 'b', '', '', 'c']
      end
    end
  end
  
end