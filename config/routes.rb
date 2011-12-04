Backend::Application.routes.draw do
  resource :session do 
    member do 
      get 'callback'
      get 'delete'
    end
  end
  
  resources :connections
  resources :profiles
  resources :scores
  root :to => 'profiles#index'
end
