Rails.application.routes.draw do
  # root to: 'users#index'

#   resources :users, only: [:show] do
#     resources :posts, only: [:index, :show, :new]
#     resources :comments, only: [:new, :create]
#     resources :likes, only: [:create]
#  end
root "users#index"
 get "users/new", to: "users#new"
 post "users", to: "users#create"
 get "users/:id", to: "users#show"
 get "users/:id/edit", to: "users#edit"
 patch "users/:id", to: "users#update"
 delete "users/:id", to: "users#destroy"
 
 get "users/:id/posts", to: "posts#index", as: 'user_posts'
 get "users/:id/posts/new", to: "posts#new", as: 'new_post'
 post "users/:id/posts/create", to: "posts#create", as: 'create_post'
 get "users/:id/posts/:post_id", to: "posts#show"
 get "users/:id/posts/:post_id/new_comment", to: "comments#new", as: 'new_comment'
 get "users/:id/posts/:post_id/create", to: "comments#create", as: 'create_comment'
 get "users/:id/posts/:post_id/create_like", to: "likes#create", as: 'create_like'
end
