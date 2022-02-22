Rails.application.routes.draw do
  root 'pages#index'
  devise_for :users,
    controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks',
      confirmations: 'users/confirmations'
    }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    put 'confirmation', to: 'users/confirmations#show', as: :back_confirmation
  end
  # resources :users do
  #   resources :goals
  # end
  # scope 'users/:user_id' do
  #   resources :goals, only: [:show]
  # end
  # resources :goals, only: [:show]
  resources :users, only: [:show]
  resources :goals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end