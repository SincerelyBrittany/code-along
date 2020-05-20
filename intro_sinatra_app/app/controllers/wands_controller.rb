class WandController < ApplicationController

  get "/wands" do
    @wands = Wand.all
    erb :"wands/index"
  end

  get "/wands/new" do
    erb :wands/new
  end

  post "/wands"do
    Wand.create(length: params[:length],core: params[:core], wood: params[:wood])
    redirect "/wands"
  end

  post '/wands/:id/delete' do
    Wand.find(params[:id]).destroy
    redirect '/wands'
  end

  post '/search' do
    # binding.pry
    #check for params in pry
    @wands = Wand.where(wood:params["search"])
    erb :"wands/index"
  end

  end
