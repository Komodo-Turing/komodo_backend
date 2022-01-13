require 'sidekiq/web'

Rails.application.routes.draw do
  # mount Sidekiq::Web => "/sidekiq"
  namespace :api do
    namespace :v1 do
        resources :contacts
        resources :timers
        resources :active_timers, only: [:update, :create]
    end
  end
end
