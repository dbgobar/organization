Rails.application.routes.draw do
  get "/pages/:page" => "pages#show"
 
  get 'messages/reply'#, to: redirect('welcome/homepage')

  devise_for :users
  resources :posts

  get 'messages/homepage'
  root 'messages#homepage'

  resource :messages do
    collection do
      post "reply"
    end
  end

end
