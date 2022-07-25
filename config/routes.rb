Rails.application.routes.draw do
  root to: "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      post "new_comment", to: "comments#create", on: :member
      post "like_post", to: "likes#create", on: :member
    end
  end
end
