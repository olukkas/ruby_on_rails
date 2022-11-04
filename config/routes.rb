Rails.application.routes.draw do
  root 'articles#index'

  resources :categories, except: :show
  resources :articles
end
