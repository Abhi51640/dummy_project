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
end
