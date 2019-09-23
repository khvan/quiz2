Rails.application.routes.draw do
 root 'ideas#index'

#  Setting up resourceful routes for ideas
  resources :ideas do 
    member do 
      get :delete
    end
  end
# setting resourceful routes for users
  resources :users do 
    member do 
      get :delete
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
