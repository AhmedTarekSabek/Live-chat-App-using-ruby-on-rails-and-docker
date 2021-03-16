Rails.application.routes.draw do
  root 'home#index'

  namespace 'api' do 
    resources :messages
    resources :conversations
    resources :users   
  end  

  devise_for :users

  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end

  
end
