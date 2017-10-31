Rails.application.routes.draw do

  devise_for :users
  root to: 'doctors#index'
  get 'doctors/list_male', to: 'doctors#list_male'
  get 'doctors/list_female', to: 'doctors#list_female'
  resources :doctors

end
