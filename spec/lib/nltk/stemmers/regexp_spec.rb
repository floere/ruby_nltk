# encoding: utf-8
#
require 'spec_helper'

describe NLTK::Stemmers::Regexp do
  
  context 'all words' do
    let(:stemmer) { described_class.new(/ing$/) }

    describe 'stem' do
      it 'works correctly' do
        stemmer.stem('interesting').should == 'interest'
      end
      it 'works correctly' do
        stemmer.stem('jumping').should == 'jump'
      end      
    end
  end
  context 'only long words' do
    let(:stemmer) { described_class.new(/ing$/, 10) }

    describe 'stem' do
      it 'works correctly' do
        stemmer.stem('interesting').should == 'interest'
      end
      it 'works correctly' do
        stemmer.stem('jumping').should == 'jumping'
      end      
    end
  end
  
end