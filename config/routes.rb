Rails.application.routes.draw do

  root 'posts#index'
  get '/posts/new' => 'posts#new'
  post '/posts' => 'posts#create'
  post '/posts/:post_id/comments' => 'comments#create'
  
end
