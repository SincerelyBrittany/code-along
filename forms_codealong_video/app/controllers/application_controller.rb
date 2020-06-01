class ApplicationController < Sinatra::Base
  set :views, Proc.new {File.join(root, "../views/")}

  # get '/' do
  #   erb :'posts/index'
  # end

end
