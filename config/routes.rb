Rails.application.routes.draw do
  resources :dispatches do
    member do
      get 'print'
    end
    collection do
      get 'scan'  # For non-member action
      post 'receive', to: 'dispatches#receive'
      get 'receive', to: 'dispatches#receive_form'
    end
  end

  resources :locations do
    collection do
      get :barangays
    end
  end

  resources :drivers
  resources :plantations
  resources :planters
  resources :locations
  resources :trucks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "dispatches#new"
end
