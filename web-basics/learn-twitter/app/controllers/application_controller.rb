class ApplicationController < Sinatra::Base

  get '/' do #Route is a get request
    "Hello World"
  end

  get '/twitter' do
    "will say twitter"
    # @tweets = TwitterSearch.new("something").tweets
    # binding.pry
    # @tweets.collect{|t| t.text.join("</br>")

    erb :"twitter.html"
end

end
