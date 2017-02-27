Rails.application.routes.draw do
  root 'home#index'
  get 'users/login' => 'users#login'
  post 'users/login_process' => 'users#login_process'
  delete 'users/logout' => 'users#logout'

  resources :users, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
