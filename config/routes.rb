Rails.application.routes.draw do

  devise_for :users
resources :posts

get 'welcome/homepage'

root 'welcome#homepage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
