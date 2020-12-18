Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  get '/account', to: 'home#log_in'
  get '/game', to: 'game#start'
  get '/game/add_letter/:curr/:number', to: 'game#add_letter'

end
