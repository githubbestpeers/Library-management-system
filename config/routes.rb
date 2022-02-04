Rails.application.routes.draw do
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  get 'b_issued/index'
  root 'books#index'

  get '/search' => 'books#search', :as => 'search_page'
  devise_for :users
  resources :books
  resources :book_issues
end
