Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
        resources :contacts, except: [:show]
    end
  end

  namespace :api do
    namespace :v1 do
        resources :timers
    end
  end

  get '/dashboard', to: 'users#show'
end
