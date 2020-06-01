class ApplicationController < Sinatra::Base

  set :views, -> {File.join(root, "../views")}

  get '/' do
    redirect '/todos'
  end


  # get '/todos' do
  #   @todos = Todo.all
  #   erb :index
  # end
end
