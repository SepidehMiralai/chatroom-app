Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :rooms, only: [:new, :create, :show, :index]

  namespace :api do
    namespace :v1 do
      
      resources :users, only: [] do
        member do
          post :messages
          get 'u_messages'
        end     
      end

      resources :rooms, only: [] do
        member do
          post :messages
          get 'room_messages'
        end
      end

      resources :rooms
      resources :users
      resources :messages
      
    end
  end

  # mount ActionCable.server => '/cable'
end
