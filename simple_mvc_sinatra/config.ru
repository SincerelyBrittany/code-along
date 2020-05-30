require_relative './config/env'


use Rack::MethodOverride
use TodosController
run ApplicationController
