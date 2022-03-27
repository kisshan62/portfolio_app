Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks',
      confirmations: 'users/confirmations'
    }
  devise_scope :user do
    # root "devise/sessions#new"
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    put 'confirmation', to: 'users/confirmations#show', as: :back_confirmation
  end
  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :goals do
    member do
      patch 'done', 'undone'
    end
    resources :steps, only: [:create, :destroy] do
      member do
        patch 'done', 'undone'
      end
    end
  end
  resources :comments, only: [:create, :destroy]
  get 'search', to: 'searches#search'
  resources :notifications, only: :index
  root 'homes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end