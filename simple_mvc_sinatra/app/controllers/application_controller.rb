class ApplicationController < Sinatra::Base

  set :views, -> {File.join(root, "../views")}

  get '/' do
    erb :home
  end


  # get '/todos' do
  #   @todos = Todo.all
  #   erb :index
  # end
end
