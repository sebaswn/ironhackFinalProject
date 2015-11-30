Rails.application.routes.draw do
      
  resources :comments
  resources :contests
  devise_for :users
  
  
 resources :posts
 resources :users, only: [:show]
 
 get '/contest/:id/enter', to: 'contests#enter', as: 'contest_enter'
 get '/contest/:id/enter/:post_id', to: "contests#add"
 get '/contest/:id/vote', to: 'contests#vote', as: 'contest_vote'
 get '/contest/:id/vote/findposts', to: 'contests#findVotePosts'
 post '/contest/votes/create', to: 'votes#create'
 get '/contest/:id/winner', to: 'contests#winner', as: 'contest_winner'
 
 get '/user/:id/finduser', to: 'users#getUserInfo'

 get '/front', to: 'registration#loginOrSignUp', as: 'users_registration'
 get '/', to: 'posts#showAll', as: 'posts_showAll'

 get '/posts/show/all' =>'posts#showAll'
 get '/posts/show/random' =>'posts#showRandom'
 get '/posts/show/popular' =>'posts#showPopular'
 get 'getPostInfo/:id' => 'posts#getPostInfo'

 post '/posts/likes/create', to: 'likes#create'
 get '/post/:id/likes', to: 'likes#findLikes'

 get '/posts/:id/comments', to: 'comments#findComments'
 post 'post/comments/create', to: 'comments#createComment'
 
end
