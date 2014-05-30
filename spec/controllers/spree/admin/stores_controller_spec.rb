require 'spec_helper'

describe Spree::Admin::StoresController do
  render_views
  stub_authorization!

  let(:subject) { FactoryGirl.create :spree_store }

  before do
    user = mock_model(Spree.user_class, spree_api_key: 'fake')
    controller.stub spree_current_user: user
  end

  describe '#index' do
    before { spree_get :index }

    it { expect(response).to be_success }
    it { expect(response).to render_template(:index) }
  end

  describe '#create' do
    context 'with valid attributes' do
      before { spree_post :create, store: subject.attributes }

      it { expect(response).to redirect_to(spree.admin_stores_path) }

      it 'saves a new store' do
        expect{ spree_post :create, store: subject.attributes }.to change(Spree::Store, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      before do
        subject.address1 = nil
        spree_post :create, store: subject.attributes
      end

      it { expect(response).to render_template(:index) }

      it 'does not save a new store' do
        expect{ spree_post :create, store: subject.attributes }.to change(Spree::Store, :count).by(0)
      end
    end
  end

  describe '#edit' do
    before { spree_get :edit, id: subject.id }

    it { expect(response).to be_success }
    it { expect(response).to render_template(:edit) }
  end

  describe '#update' do
    before { spree_put :update, id: subject.id, store: subject.attributes }

    it { expect(response).to redirect_to(spree.admin_stores_path) }
  end

  describe '#destroy' do
    before :each do
      @store = FactoryGirl.create :spree_store
    end

    it 'destroys the store' do
      expect{ spree_delete :destroy, id: @store.id }.to change(Spree::Store, :count).by(-1)
    end

    it 'redirects to index' do
      spree_delete :destroy, id: @store.id

      expect(response).to redirect_to(spree.admin_stores_path)
    end
  end

end

