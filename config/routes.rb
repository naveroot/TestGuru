# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :tests do
    member do
      post :start
    end
    resources :questions, shallow: true, exept: :index do
      resources :answers, shallow: true, exept: :index
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  root to: 'tests#index'
end
