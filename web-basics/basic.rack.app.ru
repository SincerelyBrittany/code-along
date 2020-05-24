require 'rack'
# require 'twitter'
require 'pry'

class App
  #when using rack if you build something that makes a call - it needs to respond to a 3 part array
  #the first oart is the status code ( this example is 200)
  #the second part are the headers of that response
  #the third part is the body fo the response
  #then you have a method called run -- given by the rack gem

  # def call(env)
  #   [200, {"Content-Type" => "text/html"}, ["Hello World"]]
  # end

  #https://www.youtube.com/watch?time_continue=115&v=LSUevS1PRTg&feature=emb_logo

  # client = Twitter::REST::Client.new do |config|
  # config.consumer_key        = "YOUR_CONSUMER_KEY"
  # config.consumer_secret     = "YOUR_CONSUMER_SECRET"
  # config.access_token        = "YOUR_ACCESS_TOKEN"
  # config.access_token_secret = "YOUR_ACCESS_SECRET"
  # end

  responses = client.search("Learn.co")
  # binding.pry #responses.local_methods

  html = "<ul>"
  html += responses.entries.collect{|e| "<li>#{e.text}</li>"}.join
  html += "</ul>"

  def call(env)
    [200, {"Content-Type" => "text/html"}, ["#{File.read("hello.html")}, <br> #{html}"]]
  end


  # def call(env)
  #   [200, {"Content-Type" => "text/html"}, ["#{File.read("hello.html")}, <br> #{Time.now}"]]
  # end



end

# to run in terminal you have to type "rackup basic.rack.app.ru"
run App.new
