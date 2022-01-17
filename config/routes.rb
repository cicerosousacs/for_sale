Rails.application.routes.draw do
  namespace :admins_forsale do
    resources :payments
    resources :categories
    resources :products
    resources :clients
    resources :paystatus

    get 'welcome/index'
  end

  devise_for :admins
  get 'inicio', to: 'admins_forsale/welcome#index'
  root to: 'admins_forsale/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
