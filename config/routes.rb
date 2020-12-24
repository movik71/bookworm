Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  get '/account', to: 'home#log_in'
  post '/game', to: 'game#start'
  get '/game', to: 'game#start'
  get '/game/add_letter/:letter', to: 'game#add_letter'
  get '/game/add_letter/:curr/:letter/:taken', to: 'game#add_letter'
  get '/game/delete_letter/:curr/:letter/:taken', to: 'game#delete_letter'

end
