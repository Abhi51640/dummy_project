require 'sidekiq/web'
require 'sidekiq/cron/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users,controllers: {
    sessions:'users/sessions',
    registrations: 'users/registrations'
  }
  
  resources :users
    root to: "homes#index"

  # get 'posts', to: 'posts#new'
  resources :posts do
    resources :comments
  end

  get '/auth/facebook/callback' => 'sessions#create'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
