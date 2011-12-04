Backend::Application.routes.draw do
  resource :session do 
    member do 
      get 'callback'
    end
  end
  
  resources :connections
  resources :profiles
  root :to => 'profiles#index'
end
