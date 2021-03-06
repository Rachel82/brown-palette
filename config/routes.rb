Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "user_registrations"}
  resources :users
  resources :payments
  resources :products do
    resources :comments
  end
  resources :orders, only: [:index, :show, :create, :destroy]

  get 'static_pages/index'

  get 'static_pages/about'

  get 'static_pages/contact'

  post 'static_pages/thank_you'
  
  post 'payments/create'
  get  'payments/create'

  root 'static_pages#landing_page'
  
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
