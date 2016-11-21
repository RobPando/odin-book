Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users, controllers: { registrations: 'registrations',
                                    omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users, except: [:new, :create] do
    get '/profile', to: 'profiles#show'
    get '/profile/edit', to: 'profiles#edit'
    put '/profile', to: 'profiles#update'
    get '/friends', to: 'friendships#index'
  end

  resources :posts do
    resources :comments, only: [:create]
  end
  resources :friendships, only: [:create, :update, :destroy]
end
