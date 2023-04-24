Rails.application.routes.draw do
  resources :employees
  resources :jobs 
  devise_for :users
  resources :rooms do
    resources :messages
  end
  resources :users

  root to: 'dashboards#index'
  get "jobs/:id/applied_users", to: 'dashboards#applied_users',as: "applied_user"
  get "/applied_jobs", to: 'dashboards#applied_jobs',as: "applied_jobs"

  post "jobs", to: "jobs#create", as: "create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "job_applications",  to: "jobs#job_application", as:"job_application"

  # Defines the root path route ("/")
  # root "articles#index"
end
