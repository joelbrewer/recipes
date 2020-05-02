require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require './models'
require 'byebug'

get '/' do
  @recipes = Recipe.all
  erb :index
end

get '/recipes' do
  redirect "/"
end

get '/recipes/new' do
  erb :"recipes/new"
end

get '/recipes/:id' do
  @recipe = Recipe.find(params[:id])
  erb :"recipes/show"
end


post '/recipes/new' do
  name = params[:name]
  params.delete(:name)

  r = Recipe.create(name: name)

  num_ingredients = params.count / 2
  num_ingredients.times do |i|
    Ingredient.create(
      quantity: params["qty#{i+1}"],
      recipe_id: r.id,
      name: params["ingredient#{i+1}"]
    )
  end
  redirect "/recipes/#{r.id}"
end
