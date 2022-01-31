Rails.application.routes.draw do
  get 'b_issued/index'
  # get '/welcome', to: 'welcome#index'
  get 'search', to: 'books#search'
  #root 'welcome#index'
  devise_for :users
  resources :books
  resources :book_issues

end
