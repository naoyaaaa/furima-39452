Rails.application.routes.draw do
  devise_for :users 
  root to:"items#index"
  resources :items
  resources :purchase_logs do
    resources :shipping_addresses
  end
  

end
