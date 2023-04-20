Rails.application.routes.draw do
  resources :employees
  resources :jobs 
  devise_for :users
  resources :rooms
  root to: 'message#index'
  post "jobs", to: "jobs#create", as: "create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "job_applications",  to: "jobs#job_application", as:"job_application"

  # Defines the root path route ("/")
  # root "articles#index"
end
