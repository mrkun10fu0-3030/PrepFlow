Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :prep_tasks do
    member do
      patch :complete
    end
  end
  resources :users, only: [:show]
  post "guest_sign_in", to: "sessions#guest_sign_in"
  post "guest_manager_sign_in", to: "sessions#guest_manager_sign_in"

  root "prep_tasks#index"
end
