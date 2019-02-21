Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dealts#index'
  resources :dealts
  resources :clas
  resources :unionsectors do
    collection do
      post 'get_user_list'
    end
  end
  resources :users do
    collection do
      get 'checkuser'
    end
  end
end
