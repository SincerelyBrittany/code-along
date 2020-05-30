class TodosController < ApplicationController
  get '/todos' do
    @todos = Todo.all
    erb :'/todos/index'
  end

  get '/todos/new' do
    erb :'/todos/new'
  end

  post '/todos' do
    Todo.create(content: params[:content])
    #BankAccount.update(params)
    redirect '/todos'
  end

  get '/todos/:id/edit' do
    @todo = Todo.find(params[:id])
    erb :'/todos/edit'
  end

  patch '/todos/:id' do
   @todo = Todo.find(params[:id])
   @todo.update(content: params[:content])
   redirect '/todos'
 end

 delete '/todos/:id' do
  Todo.destroy(params[:id])
  redirect to '/todos'
end


# #destroy
# delete "/articles/:id" do
#   Article.destroy(params[:id])
#   redirect to "/articles"
# end

  # patch '/todos/:id/edit' do
  #   @todo = Todo.find_by(id: params[:id])
  #   @todo.update(item: params[:content], completed: !!params[:completed])
  #   redirect '/todos'
  #   end
end

#
#
#
# class TodosController < ApplicationController
#
#     get '/todos' do
#         @todos = Todo.all #now ruby objects
#         erb :'todos/index'
#     end
#
#     post '/todos' do
#         todo = Todo.create(content: params[:content])
#         redirect '/todos'
#     end
#
#     get '/todos/new' do
#         erb :'todos/new'
#     end
#
#     get '/todos/:id' do
#         @todo = Todo.find_by(id: params[:id])
#         erb :'todos/show'
#     end
#
#     get '/todos/:id/edit' do
#         @todo = Todo.find_by(id: params[:id])
#         erb :'todos/edit'
#     end
#
#     patch '/todos/:id' do
#         @todo = Todo.find_by(id: params[:id])
#         @todo.update(item: params[:content], completed: !!params[:completed])
#         redirect '/todos'
#     end
#
#     delete '/todos/:id' do
#         @todo = Todo.find_by(id: params[:id])
#         @todo.destroy
#         redirect '/todos'
#     end
#
#
#
# end
