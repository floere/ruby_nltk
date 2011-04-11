# encoding: utf-8
#
require 'spec_helper'

describe NLTK::Tokenizers::Simple::Space do
  
  let(:tokenizer) { described_class.new }
  
  describe 'tokenize' do
    it 'tokenizes correctly' do
      tokenizer.tokenize('abcdefgh ijklmnopqrstuvwxyz').should == ['abcdefgh', 'ijklmnopqrstuvwxyz']
    end
    it 'tokenizes correctly' do
      tokenizer.tokenize("tab\tnbsp and normal spaces").should == ["tab", "nbsp and", "normal", "spaces"]
    end
  end
  
end