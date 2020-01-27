Rails.application.routes.draw do

  root 'users/homes#top'

  # devise_for :admins, path: 'find_coffee_sessions'
  # ,path_names: { sign_in: 'find_coffee_login', sign_out: 'find_coffee_logout', password: 'find_coffee_secret', confirmation: 'find_coffee_verification', unlock: 'find_coffee_unblock', registration: 'find_coffee_register', sign_up: 'find_coffee_cmon_let_me_in' }, controllers: {
    # sessions: 'admins/sessions',
    # passwords: 'admins/passwords',
    # registrations: 'admins/registrations',
  # }


  devise_for :admins
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }


  namespace :users do
    get 'homes/top'
    get 'homes/term'
    get 'homes/privacy_policy'
    resources :taists
    get 'items/research' => 'items#research', as: 'items_research'
    get "items/index_add" => "items#index_add", as: 'index_add'
    put 'items/:id/hide' => 'items#hide', as: 'items_hide'
    get 'items/:id/show_like' => 'items#show_like', as: 'items_show_like'
    get "users/:id/likes" => "users#likes"
    get "users/:id/my_index" => "users#my_index", as: 'my_index'
    get "users/taist_research" => "items#taist_research", as: 'taist_research'
    get "users/search" => "items#search", as: 'search'
    get "users_follow_index" => "items#follow_index", as: 'follow_index'

    resources :items do
      resource :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
  	end

  	resources :users do
      member do
     	  get :following, :followers
      end
    end
    resources :relationships, only: [:create, :destroy]
    resources :events
    resources :messages, only: [:show, :create]
    resources :contacts
    put "/users/:id/hide" => "users#hide", as: 'users_hide'
    resources :users
    resources :rooms
    resources :contacts, only: [:new, :create, :destroy]
    resources :notifications do
       collection do
          delete 'destroy_all'
       end
    end
  end



  namespace :admins do
  	resources :categories, only: [:create, :update]
    put 'categories/:id/hide' => 'categories#hide', as: 'categories_hide'
    resources :tastes, only: [:create, :update]
    put 'ctastes/:id/hide' => 'tastes#hide', as: 'tastes_hide'
    put "/items/:id" => "items#hide"
    get "items/index_add" => "items#index_add", as: 'index_add'
    resources :items do
      resources :comments
    end
    resources :contacts
    resources :users
    get "like" => "items#like"
    resources :contacts, only: [:index, :edit, :update, :destroy]
    get 'items/:id/show_like' => 'items#show_like', as: 'items_show_like'

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
