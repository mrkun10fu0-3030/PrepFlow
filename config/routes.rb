Rails.application.routes.draw do
  resources :prep_tasks
  devise_for :users
  
  root "prep_tasks#index"
end
