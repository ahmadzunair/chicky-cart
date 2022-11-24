Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, controllers: {
  #   confirmations: 'confirmations'
  # }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'visitors#index'

  namespace :admin do
  
  resources :dashboard, path: '/'
  
end



end
