module Spree
  module Admin
    class StoresController < Spree::Admin::BaseController
      before_action :find_store, only: [:edit, :update, :destroy]

      def index
        load_stores
        @store  = Spree::Store.new
      end

      def create
        @store = Spree::Store.new store_params

        if @store.save
          redirect_to admin_stores_path
        else
          load_stores
          flash[:error] = 'There was an error.'

          render :index
        end
      end

      def update
        @store.update_attributes store_params

        redirect_to admin_stores_path
      end

      def destroy
        @store.destroy

        redirect_to admin_stores_path
      end

      private

      def load_stores
        per_page = params[:per_page] || 20
        @stores = Spree::Store.state_ordered.page(params[:page]).per(per_page)
      end

      def find_store
        @store = Spree::Store.find_by id: params[:id]
      end

      def store_params
        params.require(:store).permit(
          :address1,
          :address2,
          :city,
          :country,
          :name,
          :phone,
          :state,
          :website,
          :zip
        )
      end
    end
  end
end

