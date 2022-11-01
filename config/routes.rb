Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks',
      confirmations: 'users/confirmations'
    }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    put 'confirmation', to: 'users/confirmations#show', as: :back_confirmation
  end
  resources :users, only: [:show] do
    member do
      get :following, :followers, :favorites
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :goals, only: [:new, :edit, :show, :update, :create,:destroy] do
    member do
      patch 'done', 'undone'
    end
    resources :steps, only: [:create, :destroy] do
      member do
        patch 'done', 'undone'
      end
    end
    resources :favorites, only: [:create, :destroy]
  end
  resources :comments, only: [:create]
  get 'search', to: 'searches#search'
  resources :notifications, only: :index
  root 'homes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end