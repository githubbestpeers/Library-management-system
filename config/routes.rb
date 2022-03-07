Rails.application.routes.draw do
  
  get 'submit_book/index'
  get 'contact/index'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  get 'b_issued/index'
  root 'books#index'
  root 'books#edit'
  root 'books#form'
  root 'books#user_list'
  get "books/about_us"

  get 'book_issues/submit_book'

 # get "books/contact_us"
  get 'contact-us', to: "contact#contact_us", as:  :contact_us
  
  get '/search' => 'books#search', :as => 'search_page'
  devise_for :users
  resources :books
  resources :book_issues
  resources :contacts, only: [:index, :new, :create]
  resources :submit_books
 # post 'welcome'
  #resources :welcome, only: [:index, :contact_us, :new, :create]
end
