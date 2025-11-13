Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # API routes
  namespace :api do
    namespace :v1 do
      # Authentication routes
      devise_for :users, 
        controllers: {
          sessions: 'api/v1/auth/sessions',
          registrations: 'api/v1/auth/registrations'
        },
        path: '',
        path_names: {
          sign_in: 'auth/sign_in',
          sign_out: 'auth/sign_out',
          registration: 'auth/sign_up'
        }
      
      # Health check endpoint
      get 'health', to: 'health#show'
      
      # API resources will be defined in Stage 2
    end
  end

  # Public routes for SSR pages
  namespace :public do
    # Public wishlist pages at /p/:slug will be added in Stage 2
  end
end
