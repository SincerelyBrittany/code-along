class ApplicationController < Sinatra::Base

  # self.get ('/') do
  # end

      # File.read('./app/views/someText.txt')

  set :views, -> {File.join(root, "../views")}

  get '/' do
    erb :index
  end

  post "/spell" do
    @spell = params[:spell]
    erb :spell
  end

end
