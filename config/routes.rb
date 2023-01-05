Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'visitors#index'

  resources :users do
    
  end

  namespace :seller do
    resources :users do
      collection do
        get :is_approved_account
        get :form_wizard
      end
    end
  end
  
  namespace :admin do
    resources :users do
      member do
        get :block
        get :unblock
        get :verify_user
        delete :delete_user
        delete :delete_blocked_user
        get :view_profile
      end
      collection do
        get :manage_subscription
        post :send_mail_create_admin
        get :view_block_user
        get :create_admin
      end
    end
    resources :dashboard, path: '/'
  
    end
  end


