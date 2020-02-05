# frozen_string_literal: true

require 'resque/server'
require 'resque/scheduler'
require 'resque/scheduler/server'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'hashtags/index'

  resources :hashtags do
    resources :tweets
  end

  resources :tweets

  root 'hashtags#index'
  mount Resque::Server.new, at: "/resque"
end
