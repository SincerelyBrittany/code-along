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

  get '/posts/:id/edit' do
    #checking if they are logged in
    #if session email is empty then I want to redirect to the login page
    if !logged_in? #&& session[:email].empty?
      redirect "/login" #redirecting if they arent logged in
    else
    #otherwise ill render a new post form
    "An edit post form" #rendering if they are
  end
  end


end
