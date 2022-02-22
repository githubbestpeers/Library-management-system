Rails.application.routes.draw do
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  get 'b_issued/index'
  root 'books#index'
  root 'books#edit'
  root 'books#form'
  root 'books#user_list'
  get "books/about_us"
  get "books/contact_us"
   get "welcome/contact_us"
  # get "welcomes/new"
   get "welcome/index"
   root 'welcome#index'
   get "welcome/new"
   root 'welcome#new'
  get 'contact_us', to: "books#contact_us", as:  :contact_us
  get '/search' => 'books#search', :as => 'search_page'
  devise_for :users
  resources :books
  resources :book_issues
  resources :welcomes
 # post 'welcome'
  #resources :welcome, only: [:index, :contact_us, :new, :create]
end
