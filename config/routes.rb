Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'

  resources :categories, except: :show
  resources :articles
end
