Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      post 'auth/login', to: 'authentication#login'
      resources :posts do
        resources :comments
      end
      resources :ratings
      get 'timeline', to: 'timeline#index'
    end
  end
end
