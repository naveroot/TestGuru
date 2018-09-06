# frozen_string_literal: true

Rails.application.routes.draw do

  get 'badges_controller/index'
  get 'badges_controller/show'
  get 'badges_controller/new'
  get 'badges_controller/create'
  get 'badges_controller/edit'
  get 'badges_controller/update'
  get 'badges_controller/destroy'
  root to: 'tests#index'
  devise_for :users, path: :gurus, path_names: {sign_in: :login, sign_out: :logout},
             controllers: {sessions: 'sessions'}

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :feedback, only: %i[ new create]

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :badges_controller
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, exept: :index do
        resources :answers, shallow: true, exept: :index
      end
    end
  end
end
