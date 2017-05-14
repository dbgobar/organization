Rails.application.routes.draw do
  get "/pages/:page" => "pages#show"


  devise_for :users
  resources :posts

  get 'welcome/homepage'
  root 'welcome#homepage'


end
