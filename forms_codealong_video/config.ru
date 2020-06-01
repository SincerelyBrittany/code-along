#Loading the environment
require_relative 'config/environment'


use Rack::MethodOverride
#Starting the Application
use PostsController #MOUNTING A CONTROLLER
#You need to mount controllers because otherwise out Application
#wont know that we have a class to respond to those requests

#Everytime I add a controller.
# 1. Inherit from ApplicationController
# 2. Mount the controller in config.ru

run ApplicationController

#TO shart application put 'rackup config.ru or shotgun in the terminal'
