require_relative 'config/env'

use AboutController #finds a method without actually evoking it
run ApplicationController #can only have one run

# You can test if this filw works with the below but it should be in controllers
# get '/' do
#   "it works"
# end
#
# run Sinatra::Application
