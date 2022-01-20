Rails.application.routes.draw do
  get '/welcome', to: 'welcome#index'
  root 'welcome#index'
  devise_for :users
  resources :books
end
