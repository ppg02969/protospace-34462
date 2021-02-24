Rails.application.routes.draw do
  devise_for :users
  get 'prototypes/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "prototypes#index"

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy, :post] do
    resources :comments, only: [:create, :new]
  end
  resources :users, only: :show
end
