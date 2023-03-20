Rails.application.routes.draw do
  namespace :customers do
    get 'homes/top'
  end


  namespace :admins do
    get 'orders/show'

    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'

    resources :genres, only: [:index, :create, :edit, :update]
    # get 'genres/index'
    # post 'genres' => 'genres#create'
    # get 'genres/edit'
    # patch 'genres/:id' => 'genres#update', as: 'update_genre'

    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    # get 'items/index'
    # get 'items/new'
    # post 'items' => 'items#create'
    # get 'items/show'
    # get 'items/edit'
    patch 'items/:id' => 'items#update', as: 'update_item'

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

