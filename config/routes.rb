Rails.application.routes.draw do
  get 'friends/index'
  
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks" 
  }
  # devise_scope :user do
  #   get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  resources :profile

  resources :posts do
    resources :comments
  end

  resources :friends do 
    member do
      post :add_friend
    end
  end

  resources :groups

  resources :prashants



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end


