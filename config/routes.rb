Rails.application.routes.draw do
      
  devise_for :users
  
  
 resources :posts
 resources :users, only: [:show]
 
 
 get '/', to: 'posts#showAll', as: 'posts_showAll'
 get '/front', to: 'registration#loginOrSignUp', as: 'users_registration'

end
