Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show, :update, :destroy]
      resources :resumes, only: [:create, :show, :update, :destroy]
      resources :portfolios, only: [:create, :show, :update, :destroy]
      resources :testimonials, only: [:index, :create, :update, :destroy]
      resources :socials, only: [:index, :create, :update, :destroy]
      resources :projects, only: [:index, :create, :update, :destroy]
      resources :skills, only: [:index, :create, :update, :destroy]
      resources :works, only: [:index, :create, :update, :destroy]
      resources :educations, only: [:index, :create, :update, :destroy]



      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'

    end
  end
end
