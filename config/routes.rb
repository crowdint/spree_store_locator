Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :stores, except: :show
  end

  resources :stores, only: :index, path: :store_locator
end

