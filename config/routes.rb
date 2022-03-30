require 'sidekiq/web'
Rails.application.routes.draw do
  resources :book_issues, only:[:index]
  mount Sidekiq::Web => '/sidekiq'


   get '/edit', to: 'book_issues#edit'
  post '/book_issues/submit', to: 'book_issues#submit'



  resources :payments
  get 'wepay/index'
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
  get 'book_issues/perticular_user'
  root 'book_issues#perticular_user'
 # get "books/contact_us"
  get 'contact-us', to: "contact#contact_us", as:  :contact_us
  
  get '/search' => 'books#search', :as => 'search_page'
  devise_for :users,  controllers: { registrations: "registrations" }
  resources :books
  resources :book_issues
  resources :contacts, only: [:index, :new, :create]
  resources :submit_books
  resources :total_fines
  resources :registrations
  get '/payments/:action(/:payment_id)', :controller => 'payments'

  root :to => "wepay#index"
 
  #get "/paypal_url" => "books#paypal_url"
 # post 'welcome'
  #resources :welcome, only: [:index, :contact_us, :new, :create]

  get '/', :to => 'total_fines#index'
  post :create_total_fine, :to => 'total_fines#create_total_fine'
  post :capture_total_fine, :to => 'total_fines#capture_total_fine'
end
