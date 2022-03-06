Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks',
      confirmations: 'users/confirmations'
    }
  devise_scope :user do
    root "devise/sessions#new"
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    put 'confirmation', to: 'users/confirmations#show', as: :back_confirmation
  end
  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :goals
  resources :comments, only: [:delete, :create]
  # post 'search', to: 'searches#search'
  get 'search', to: 'searches#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end