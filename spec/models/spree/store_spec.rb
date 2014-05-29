require 'spec_helper'

describe Spree::Store do
  context 'with invalid params' do
    let(:subject) { FactoryGirl.create :spree_store }

    before do
      subject.address1 = ''
      subject.save
    end

    it 'returns an error message' do
      expect(subject.errors.messages).not_to eql({})
    end

    it 'is invalid' do
      expect(subject.valid?).to eq(false)
    end
  end

end


