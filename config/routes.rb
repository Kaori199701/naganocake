Rails.application.routes.draw do
  namespace :customers do
    get 'homes/top'
  end
  namespace :admins do
    get 'orders/show'
  end
  namespace :admins do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admins do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admins do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
    
  end
  namespace :admins do
    get 'homes/top'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  get '/' => 'homes#top'
  get '/homes/about'

  devise_for :admins


  # , controllers: {
  #  registrations: "admins/registrations",
  #  sessions: "admins/sessions",
  #  passwords: "admins/passwords",
  #  confirmations: "admins/confirmations"
  # }


  devise_for :customers


  # , controllers: {
  #  registrations: "users/registrations",
  #  sessions: "users/sessions",
  #  passwords: "users/passwords",
  #  confirmations: "users/confirmations"
  # }

end

