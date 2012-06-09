Internlunch2::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
  #  get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
   get 'sign_in', :to => 'users/sessions#new', :as => :new_user_session
   get 'sign_out', :to => 'users/sessions#destroy', :as => :destroy_user_session
  end

  root :to => 'pages#home'
end
