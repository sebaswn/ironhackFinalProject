Rails.application.routes.draw do
      
  devise_for :users
  
  
 resources :posts
 resources :users, only: [:show]
 
 get 'getPostInfo/:id' => 'posts#getPostInfo'
 get '/', to: 'posts#showAll', as: 'posts_showAll'
 get '/posts/show/all' =>'posts#showAll'
 get '/posts/show/random' =>'posts#showRandom'
 get '/front', to: 'registration#loginOrSignUp', as: 'users_registration'

end
