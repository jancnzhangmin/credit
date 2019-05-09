Rails.application.routes.draw do
  get 'basesectors/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'logins#index'
  resources :dealts
  resources :clas
  resources :unionsectors do
    collection do
      post 'get_user_list'
    end
  end
  resources :basesectors do
    collection do
      post 'get_user_list'
    end
  end
  resources :users do
    collection do
      get 'checkuser'
      get 'checkauth'
    end
  end
  resources :flowtemplates
  resources :flowdefs do
    member do
       get 'del_wordtype'
      get 'up_wordtype'
      get 'down_wordtype'
    end
  end
  resources :flows do
    collection do
      post 'uploadfile'
      get 'get_attachments'
      get 'del_attachment'
    end
  end
  resources :logins do
    collection do
      get 'logout'
    end
  end
  resources :modpwds
  resources :usergroups
  resources :myflows
end
