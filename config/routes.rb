Rails.application.routes.draw do
  #get 'transaction/create'
  resources :users
  #post '/users/:id/payment', to: 'users#payment'
  get '/users/:id/feed', to: 'users#feed'
  get '/users/:id/balance', to: 'users#balance'

  defaults format: :json do
  resources :users, only: [] do
    resources :payments, only: :create
  end
  end

end
