Rails.application.routes.draw do

  root 'users/homes#top'

  devise_for :admins, path: 'auth', path_names: { sign_in: 'find_user_coffee_login', sign_out: 'panda_and_coffee_with_ryoko_play_logout', password: 'panda_and_coffee_with_ryoko_play_secret', confirmation: 'panda_and_coffee_with_ryoko_play_verification', unlock: 'panda_and_coffee_with_ryoko_play_unblock', registration: 'panda_and_coffee_with_ryoko_play_register', sign_up: 'panda_and_coffee_with_ryoko_play_cmon_let_me_in' }, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations',
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
  }


  namespace :users do
    get 'homes/top'
    get 'homes/thanks'
    get ':id/unsubscribe' => "homes#unsubscribe", as: "unsubscribe"
    resources :taists
    get 'items/research' => 'items#research', as: 'items_research'
    get "items/index2" => "items#index2", as: 'index2'
    put 'items/:id/hide' => 'items#hide', as: 'items_hide'
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
    put "/users/:id" => "users#hide", as: 'users_hide'
    resources :users
    resources :rooms

  end



  namespace :admins do
  	resources :categories, only: [:create, :update]
    put 'categories/:id/hide' => 'categories#hide', as: 'categories_hide'
    resources :tastes, only: [:create, :update]
    put 'ctastes/:id/hide' => 'tastes#hide', as: 'tastes_hide'
    put "/items/:id" => "items#hide"
    resources :items, only: [:new, :create, :edit, :update, :index, :show] do
      resources :comments
    end
    resources :contacts
    resources :users
    get "like" => "items#like"

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
