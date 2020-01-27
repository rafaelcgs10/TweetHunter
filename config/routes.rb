require 'resque/server'
require 'resque/scheduler'
require 'resque/scheduler/server'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'hashtags#index'

  resources :hashtags do
    resources :tweets
  end
  
  mount Resque::Server.new, at: "/resque"
end
