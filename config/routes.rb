# frozen_string_literal: true

Rails.application.routes.draw do

  root to: 'tests#index'
  devise_for :users, path: :gurus, path_names: {sign_in: :login, sign_out: :logout}

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
