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
  root 'pages#index'
  # resources :users do
  #   resources :goals
  # end
  scope ':users/:user_id' do
    resources :goals
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
