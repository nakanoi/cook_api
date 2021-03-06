Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations',
        sessions: 'api/v1/auth/devise_sessions',
      }

      namespace :auth do
        resources :sessions, only: [:index]
      end

      resources :foods, only: [:index, :show, :create]
    end
  end
end
