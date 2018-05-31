Rails.application.routes.draw do

  resources :categories, except: [:show] do
    resources :posts
  end

  resources :comments, only: [:index, :create]

  root to: 'categories#index'
end
