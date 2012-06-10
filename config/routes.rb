Internlunch::Application.routes.draw do
  resources :companies
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
  #  get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
   get 'sign_in', :to => 'pages#home', :as => :new_user_session
   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  match 'register', :to => 'register#index', :as => :add_user_info_form
  match 'register/create', :to => 'register#create', :as => :add_user_info

  match 'geofeed', :to => 'pages#geofeed'

  get 'info' => 'pages#info'

  root :to => 'pages#home'
end
