Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :orders, only: [:index, :show, :create, :destroy]
  resources :payments
  resources :products do
    resources :comments

  end

  mount ActionCable.server => '/cable'

  post 'payments/create'
  get 'payments/show'

  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  get 'simple_pages/landing_page'
  root 'simple_pages#index'
  post 'simple_pages/thank_you'
  get 'simple_pages/admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
