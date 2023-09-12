Rails.application.routes.draw do
  resources :users, only: [:show, :edit]
  root to: 'homes#top'
  devise_for :users
  get "/homes/about" => "homes#about", as: "about"
  
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :edit, :update]
end