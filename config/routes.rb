Rails.application.routes.draw do

  devise_for :admins
  root 'users/homes#top'


  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
  }


  namespace :users do
    get 'homes/top'
    get 'homes/term'
    get 'homes/privacy_policy'
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
    resources :contacts, only: [:new, :create, :destroy]
    resources :notifications

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
    resources :contacts, only: [:index, :edit, :update, :destroy]

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
