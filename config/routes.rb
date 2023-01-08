Rails.application.routes.draw do
 
  resources :instudios do 
  resources :moodboards, only: :index 
  resources :addons, only: :index 
  resources :calendars, only: [ :new, :create ]
  end

  resources :calendars
  resources :products
  resources :moodboards, only: [ :show, :edit, :update, :destroy, :index ]
  resources :addons, only: [ :show, :edit, :update, :destroy, :index ]

  resources :products do 
    resources :moodboards, only: [ :new, :create ]
    resources :addons, only: [ :new, :create, :index ]

  end

  resources :clients
  
  devise_for :users
  root to: "pages#home"

  resources :categories do 
    resources :backgrounds, only: [ :new, :create, :index ]
    resources :angles, only: [ :new, :create, :index ]
    resources :sizes, only: [ :new, :create, :index ]
   end
  
   resources :angles, only: [ :show, :edit, :update, :destroy ]
   resources :backgrounds, only: [ :show, :edit, :update, :destroy ]
   resources :sizes, only: [ :show, :edit, :update, :destroy ]
   resources :briefings, only: [ :show, :edit, :update, :destroy ]
   resources :deliveries, only: [ :show, :edit, :update, :destroy ]


   get '/profile', to: 'pages#profile'
   get '/new', to: 'pages#new'
   get '/dashboard', to: 'pages#dashboard'
   get '/dashboard_instudio', to: 'pages#dashboard_instudio'

   resources :orders do 
      resources :categories, only: [:index ]
      get '/sizes', to: 'orders#sizes'
      get '/angles', to: 'orders#angles'
      get '/backgrounds', to: 'orders#backgrounds'
      get '/checkout', to: 'orders#checkout'
      get '/delivery', to: 'orders#delivery'

      resources :briefings, only: [ :new, :create, :index ]
      resources :deliveries, only: [ :new, :create, :index ]

    end 
   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
