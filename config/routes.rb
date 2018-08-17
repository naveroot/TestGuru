# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tests#index'
  get :signup, to: 'users#new'
  resources :users, only: :create
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tests do
    post :start, on: :member
    resources :questions, shallow: true, exept: :index do
      resources :answers, shallow: true, exept: :index
    end
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end


end
