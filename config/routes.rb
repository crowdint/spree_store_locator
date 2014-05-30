Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :stores, except: :show
  end
end

