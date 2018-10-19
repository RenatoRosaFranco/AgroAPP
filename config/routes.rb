# frozen_stirng_literal: true
Rails.application.routes.draw do

	# Dashboard
  mount RailsAdmin::Engine => '/dashboard', as: 'rails_admin'

  # Authentication
  devise_for :users

  # Application
  root to: 'home#index'
  resource :contact
end
