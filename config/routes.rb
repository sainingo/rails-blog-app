Rails.application.routes.draw do
  get 'users/post'
  get 'users/posts'
  get 'users/users'
  get 'users/user'
  # get "/users", to: "user#user"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
