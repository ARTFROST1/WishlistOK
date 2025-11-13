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
      
      # Guest auth endpoints (Lite Mode)
      namespace :auth do
        resources :guests, only: [:create] do
          collection do
            put :upgrade
            get :status
          end
        end
      end
      
      # Wishlist resources
      resources :wishlists do
        member do
          get :share_link
        end
        
        # Nested wishes under wishlists
        resources :wishes, except: [:index] do
          # Nested claims under wishes
          resources :claims do
            member do
              post :mark_purchased
            end
          end
        end
      end
      
      # Standalone wish endpoints
      resources :wishes, only: [] do
        collection do
          post :parse
        end
        
        # Direct access to claims
        resources :claims, only: [:index, :show]
      end
      
      # Special routes for shared/public access
      get 'wishlists/by_slug/:slug', to: 'wishlists#by_slug'
      get 'wishlists/shared/:id', to: 'wishlists#shared'
      
      # User claims
      get 'users/:user_id/claims', to: 'claims#user_claims'
      
      # Ideas Feed (curated collections)
      resources :ideas, only: [:index, :show] do
        collection do
          get :categories
          get :featured
          get :trending
        end
      end
    end
  end

  # Public routes for SSR pages
  namespace :public do
    resources :wishlists, only: [:show], param: :slug
  end
  
  # Convenient route for /p/:slug
  get '/p/:slug', to: 'public/wishlists#show'
end
