Rails.application.routes.draw do
  devise_for :user
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  get '/account', to: 'home#log_in'
  post '/game', to: 'game#start'
  post '/game/:letters/:word', to: 'game#start'
  get '/game', to: 'game#start'
  get '/game/add_letter/:letters/:letter', to: 'game#add_letter'
  get '/game/add_letter/:letters/:curr/:letter/:taken', to: 'game#add_letter'
  get '/game/delete_letter/:letters/:curr/:letter/:taken', to: 'game#delete_letter'

end
