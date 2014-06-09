require 'spec_helper'

describe Spree::StoresController do
  render_views

  let(:subject) { FactoryGirl.create :spree_store }

  describe '#index' do
    context 'when is called using a normal GET request' do
      before { spree_get :index }

      it { expect(response).to be_success }
      it { expect(response).to render_template(:index) }
    end

    context 'when is called using a XHR request' do
      before { spree_xhr_get :index }

      it { expect(response).to be_success }
      it { expect(response.content_type).to match(/json/) }
    end
  end
end

