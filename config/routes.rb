Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/:id/payment', to: 'users#payment'
  get '/users/:id/feed', to: 'users#feed'
  get '/users/:id/balance', to: 'users#balance'

end
