Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

 
 # Routes for JobPosts
 resources :job_posts, except: [:new, :edit]
 resources :job_applications, except: [:new, :edit] do
  put 'mark_as_seen', on: :member
 end

  namespace :users do
    get 'index'
    delete 'destroy'
  end
  post '/registration', to: 'users#registration'
  post '/login', to: 'users#login'

end
