class UsersController < ApplicationController

  # get '/posts' do
  #   "You are logged in as #{session[:email]}"
  #   # erb :'sessions/login'
  # end

  get '/signup' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save
      redirect '/login' #This is a redirect
    else
    erb :'users/new' #THis is a render
    end
  end
end
