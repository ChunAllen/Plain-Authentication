Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]

  root to: "dashboard#index"

  namespace :api do
    namespace :v1 do
      resources :authentication do
        collection do
          post 'sign_in'
          post 'sign_up'
        end
      end
    end
  end


end
