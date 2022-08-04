Rails.application.routes.draw do
  resources :ratings
  namespace :api do
    namespace :v1 do
      resources :users
      post 'auth/login', to: 'authentication#login'

      resources :posts do
        resources :comments
      end
    end
  end
end
