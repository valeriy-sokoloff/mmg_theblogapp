Rails.application.routes.draw do

  resources :categories, except: [:show] do
    resources :posts
  end

  root to: 'categories#index'
end
