Rails.application.routes.draw do
  resources :users
  post '/users/:id/payment', to: 'users#payment'
  get '/users/:id/feed', to: 'users#feed'
  get '/users/:id/balance', to: 'users#balance'

end
