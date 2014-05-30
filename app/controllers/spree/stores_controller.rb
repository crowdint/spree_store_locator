module Spree
  class StoresController < Spree::StoreController
    def index
      @stores = Spree::Store.all
    end
  end
end

