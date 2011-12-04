Backend::Application.routes.draw do
  resource :session do 
    member do 
      get 'callback'
    end
  end
  
  resources :connections
  root :to => 'connections#index'
end
