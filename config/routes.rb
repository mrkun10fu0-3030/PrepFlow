Rails.application.routes.draw do
  get "users/show"
  resources :prep_tasks
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :users, only: [:show]
  
  root "prep_tasks#index"
end
