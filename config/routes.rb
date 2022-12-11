Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'visitors#index'

  namespace :seller do
    resources :users do
      
    end
  end
  
  namespace :admin do
    resources :users do
      member do
        get :block
        get :unblock
        delete :delete_user
        delete :delete_blocked_user
        get :view_profile
      end
      collection do
        post :send_mail_create_admin
        get :view_block_user
        get :create_admin
      end
    end
    resources :dashboard, path: '/'
  
    end
  end


