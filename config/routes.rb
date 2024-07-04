Rails.application.routes.draw do
  resources :users

  post '/account', to: 'bank_accounts#create'
  get '/accounts', to: 'bank_accounts#index'

  get '/movimentations', to: 'transactions#index'
  post '/transfer', to: 'transactions#create'
end
