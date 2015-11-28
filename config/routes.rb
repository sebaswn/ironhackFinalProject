Rails.application.routes.draw do
      
  resources :contests
  devise_for :users
  
  
 resources :posts
 resources :users, only: [:show]
 
 get 'getPostInfo/:id' => 'posts#getPostInfo'
 get '/', to: 'posts#showAll', as: 'posts_showAll'
 get '/posts/show/all' =>'posts#showAll'
 get '/posts/show/random' =>'posts#showRandom'
 get '/front', to: 'registration#loginOrSignUp', as: 'users_registration'
 get '/contest/:id/enter', to: 'contests#enter', as: 'contest_enter'
 get '/contest/:id/enter/:post_id', to: "contests#add"
 get '/contest/:id/vote', to: 'contests#vote', as: 'contest_vote'
 get '/contest/:id/vote/findposts', to: 'contests#findVotePosts'

end
