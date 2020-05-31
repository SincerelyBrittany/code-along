class SessionsController < ApplicationController

  get '/login' do
    erb :'sessions/login'
  end

  post '/sessions' do
    # raise params.inspect
    #You want to put the params in a session - you want to persist the cookie/information
    # session[:email] = params[:email]
    #login a user with an email
    login(params[:email])
    redirect '/posts'
  end

  get '/logout' do
    logout!
    # session.clear
    redirect '/posts'
  end

end
