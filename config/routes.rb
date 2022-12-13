Rails.application.routes.draw do
  # Defines the root path route ("/")
 root "users#index"

 resources :users, only: [:index, :show] do
   resources :posts, only: [:index, :show]
 end
end
