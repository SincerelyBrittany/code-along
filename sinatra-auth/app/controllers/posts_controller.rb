class PostsController < ApplicationController

  get '/posts' do
    "You are logged in as #{session[:email]}"
    # erb :'sessions/login'
    "A list of publically available posts"
  end

  get '/posts/new' do
    #checking if they are logged in
    #if session email is empty then I want to redirect to the login page
    if !logged_in? #&& session[:email].empty?
      redirect "/login" #redirecting if they arent logged in
    else
    #otherwise ill render a new post form
    "A new post form" #rendering if they are
  end
  end

  # get '/posts/:id/edit' do
  #   #checking if they are logged in
  #   #if session email is empty then I want to redirect to the login page
  #   if !logged_in? #&& session[:email].empty?
  #     redirect "/login" #redirecting if they arent logged in
  #   else
  #     #how fo i find the post that only the author user is allowed to see
  #     post = Post.find(params[:id])
  #   #otherwise ill render a new post form
  #    if post.user_id == current_user.id
  #      "An edit post form #{current_user.id} is editing #{post.id}" #rendering if they are
  #    else
  #      redirect '/posts'
  #    end
  # end
  # end


  get '/posts/:id/edit' do
    if !logged_in?
      redirect "/login"
    else
      if post = current_user.posts.find(params[:id])
       "An edit post form #{current_user.id} is editing #{post.id}"
     else
       redirect '/posts'
     end
   end
  end
end
