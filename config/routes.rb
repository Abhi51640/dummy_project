Rails.application.routes.draw do
  
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
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
