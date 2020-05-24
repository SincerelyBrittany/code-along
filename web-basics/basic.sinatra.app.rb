require 'sinatra'
# require 'twitter'
require 'pry'

# DSL - Domain SPecific language
#get is creating the rack application for you

get '/' do #route
  "hello world"
end
