class PostsController < ApplicationController
  get '/' do
    @posts = Post.all

    erb :'posts/index'
  end

  # get '/posts/favorites' do
  #   #posts with id 2 and 3 are my favorites
  #   #how do I load only post 2 and 3
  #   #@favorites = Post.where(:id=> [2,3])
  #   @favorites = Post.find([2,3])
  #   erb :'posts/favorites.html'
  # end
  #postsnew action
  #do i need a new url? and do i need to change my database?
  get '/posts/new' do #Route/url
    #The new action is responsible for presenting a form
    erb :"posts/new" #view
  end

  get '/posts/:id' do #creating a route variable
    # raise params.inspect
    #I want to load the blogpost based on the value of
    #id in the URL
    @post = Post.find(params[:id])
    erb :'posts/show' #render the posts/show template
  end



  #posts#create action
 post '/posts' do
   #the create action is responsible for processing that form
   #raise params.inspect
   #The goal at the end of this post is to have created a blog post
   #with the data from the form that lives in in params
   #and save it to the database
   #params{"title" => "The title of my post", "content" => "The content of my post"}

   @post = Post.new #first instatinate a new blog post could also do Post.new(params) -- only if the fields match
   #or Post.new(title: params[title], content: params[:content])
   @post.title = params[:title] #sets the title to the post title
   @post.content = params[:content] #sets content to the post content
   @post.save
   redirect "posts/#{@post.id}"
 end

end

#Routes that my application supports
#What happens when the post index actions occurs
# when i submit a request to the root of my website -- your controller cts like a waiter
#   It is like Resturant
#   Model chef - know how to make data-- managae data dont care what it looks like -- only know how to find new post and then do whatever you want it it
# waiter is responsible for going from the user/ to blog post -- waitier goes to customer then goes to chef and ill take and give it to the
#
#VIEWS : PRESENTATION
# CONTROLLER : LOGIC
# MODELS : DATA
#
