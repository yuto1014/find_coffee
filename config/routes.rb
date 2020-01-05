Rails.application.routes.draw do
  namespace :users do
    get 'homes/about'
    get 'homes/thanks'
    get 'homes/unsubscribe'
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
