Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sellers
  resources :buyers
  resources :deals
  resources :claimed_deals
end
