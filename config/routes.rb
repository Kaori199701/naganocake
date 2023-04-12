Rails.application.routes.draw do

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "publics/registrations",
    sessions: "publics/sessions"
  }

  devise_for :admins

  namespace :publics do
    get 'homes/top'

    resources :items, only: [:index, :show]
     get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    resources :customers, only: [:index, :show, :edit, :update]
    patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    resources :genres, only: [:show]
    resources :cart_items, only: [:index, :update, :destroy, :create]do
       collection do
         delete "destroy_all"   #パスが　all_destroy_cart_items_path, method: :delete　となる
       end
     end
    patch '/customers/:id' => 'customers#update', as: 'update_cart_item'
    post '/orders/confirm'
    get '/orders/complete'
    resources :orders, only: [:new, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  namespace :admins do
    get 'homes/top'

    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
    resources :customers, only: [:index, :show, :edit, :update]
    patch 'customers/:id' => 'customers#update', as: 'update_customer'
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
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  get '/' => 'homes#top'
  get '/homes/about'


  # , controllers: {
  #  registrations: "admins/registrations",
  #  sessions: "admins/sessions",
  #  passwords: "admins/passwords",
  #  confirmations: "admins/confirmations"
  # }


  # , controllers: {
  #  registrations: "users/registrations",
  #  sessions: "users/sessions",
  #  passwords: "users/passwords",
  #  confirmations: "users/confirmations"
  # }

end

