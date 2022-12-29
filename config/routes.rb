Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for "User", at: "auth", controllers: {
        sessions: "api/v1/overrides/sessions",
        registrations: "api/v1/overrides/registrations"
      }

      resources :tweets
      resources :users, only: [:show]
      resources :likes
    end
  end
end
