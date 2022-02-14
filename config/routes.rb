Rails.application.routes.draw do
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  get 'b_issued/index'
  root 'books#index'
  root 'books#edit'
  root 'books#form'
  get "books/about_us"
  get "books/contact_us"
  get "welcome/contact_us"
  get "welcome/new"
  get "welcome/index"
  get 'contact_us', to: "welcome#contact_us", as:  :contact_us
  get '/search' => 'books#search', :as => 'search_page'
  devise_for :users
  resources :books
  resources :book_issues
  resources :welcomes
end
