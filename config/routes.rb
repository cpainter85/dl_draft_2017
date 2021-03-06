Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'draft#index'

  get 'sign-in', to: 'authentication#new'
  post 'sign-in', to: 'authentication#create'
  get 'sign-out', to: 'authentication#destroy'

  resources :users, only: [:show] do
    resources :draft_picks, expect: [:index]
    resources :votes, only: [:create]
  end

  resources :rounds, only: [] do
    resources :matches, only: [:index, :new, :create]
  end

  get 'semifinals', to: 'draft#semifinals'
  get 'finals', to: 'draft#finals'
end
