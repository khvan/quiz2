Rails.application.routes.draw do
  get 'members/index'
  get 'members/show'
  get 'members/new'
  get 'members/edit'
  get 'members/delete'
  get 'ideas/index'
  get 'ideas/show'
  get 'ideas/new'
  get 'ideas/edit'
  get 'ideas/delete'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  get 'users/delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
