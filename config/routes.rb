Rails.application.routes.draw do
  # get 'store/index'
  root 'store#index', as: 'store_index'
  resources :products
  # root 'application#hello'
end
