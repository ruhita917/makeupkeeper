Rails.application.routes.draw do

root 'static_pages#home'

post "/archive_user", to: "users#archive_user"

      resources :eyeshadows, only: [:index, :show] do
        resources :reviews, only: [:create, :show, :new]
      end
      resources :lipsticks, only: [:index, :show] do
        resources :reviews, only: [:create, :show, :new]
      end

      resources :mascaras, only: [:index, :show] do
        resources :reviews, only: [:create, :show, :new]
      end

      resources :reviews, only: [:index, :show, :create]


      devise_for :users
      resources :users, only: [:show]
      scope "/admin" do
        resources :users, only: [:index]
        resources :reviews, only: [:index]
        end
      end
