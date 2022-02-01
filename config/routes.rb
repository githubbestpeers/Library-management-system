Rails.application.routes.draw do
  get 'b_issued/index'
  root 'books#index'

  get '/search' => 'books#search', :as => 'search_page'
  #get 'book_issues'
  # get '/welcome', to: 'welcome#index'
  #get 'search', to: "books#search"
  #root 'welcome#index'
  devise_for :users
  resources :books
  resources :book_issues
end
