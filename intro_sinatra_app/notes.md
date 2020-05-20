bundle add sinatra
bundle add shotgun
bundle add pry
bundle add rake
bundle add activerecord
bundle add sinatra-activerecord
bundle add sqlite3

touch app/controller/application_controller.rb

rake -T
rake db:create_migration create_wands
rake db:seed


<% if @spell %>
<!-- <p><%= @spell %></p> -->
<%= end %>



Know how to create a search bar
