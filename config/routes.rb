Rails.application.routes.draw do
  get "users/show"
  resources :prep_tasks
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :users, only: [:show]
  post "guest_sign_in", to: "sessions#guest_sign_in"
  post "guest_manager_sign_in", to: "sessions#guest_manager_sign_in"
  
  root "prep_tasks#index"
end
