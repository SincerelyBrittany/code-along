



require_relative './config/environment'

# require './config/environment'

#if ActiveRecord::Base.connection.migration_context.needs_migration?
#  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
#end

use Rack::MethodOverride
# use Rack::Session::Cookie
use SessionsController
use PostsController
use UsersController
run ApplicationController