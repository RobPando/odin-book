Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :users, except: [:new, :create] do
    get '/profile', to: 'profiles#show'
    get '/profile/edit', to: 'profiles#edit'
    put '/profile', to: 'profiles#update'
  end
  resources :posts
  resources :comments, except: [:show]
end
