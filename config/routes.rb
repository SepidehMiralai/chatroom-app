Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :rooms, only: [:new, :create, :show, :index]

  namespace :api do
    namespace :v1 do
      # resources :users, only: [] do
      resources :users do
        member do
          post :messages
          get 'u_messages'
        end  
        
      end

      # resources :rooms, only: [] do
      resources :rooms do
        member do
          post :messages
          get 'room_messages'
        end
        
      end

      resource :rooms
      resource :users
      
    end
  end

  # mount ActionCable.server => '/cable'
end
