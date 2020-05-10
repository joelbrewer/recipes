require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'sinatra/base'
require './models'
require 'byebug'

class App < Sinatra::Base
  set sessions: true

  register do
    def auth type
      condition do
        redirect '/login' unless send("is_#{type}?")
      end
    end
  end

  helpers do
    def is_user?
      @user != nil
    end

    def is_owner_or_admin?
      @recipe = Recipe.find(params[:id])
      (@user != nil) &&
      (@user.id == @recipe.user_id) ||
       @user.admin?
    end
  end

  before do
    @user = User.find(session[:user_id]) unless !session[:user_id]
  end

  get '/' do
    @recipes = Recipe.order("lower(name)").all
    erb :index
  end

  get '/login' do
    erb :"sessions/new"
  end

  post '/login' do
    email = params[:email]
    password = params[:password]
    user = User.find_by_email email

    if user && user.password == password
      session[:user_id] = user.id
      redirect "/"
    else
      redirect "/login"
    end
  end

  get '/signup' do
    if params[:userExists]
      @message = "Email already exists."
    end
    erb :"users/new"
  end

  post '/signup' do
    user = User.find_by_email params[:email]
    if user
      redirect "/signup?userExists=t"
    else
      u = User.create(email: params[:email])
      u.password = params[:password]
      u.save
      session[:user_id] = u.id
    end
    redirect "/"
  end

  get '/logout' do
    session[:user_id] = nil
    redirect "/login"
  end

  get '/recipes' do
    redirect "/"
  end

  get '/recipes/:id/edit', auth: :owner_or_admin do
    erb :"recipes/edit"
  end

  get '/recipes/:id/delete', auth: :owner_or_admin do
    @recipe.destroy!
    redirect "/"
  end


  post '/recipes/:id/edit', auth: :owner_or_admin do
    params[:user_id] = @user.id
    ingredients = params[:ingredients]
    params.delete(:ingredients)
    @recipe.update(params)
    @recipe.ingredients.destroy_all
    ingredients.each { |i| @recipe.ingredients.create( name: i[:name]) }
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/new', auth: :user do
    erb :"recipes/new"
  end

  post '/recipes/new', auth: :user do
    params[:user_id] = @user.id
    ingredients = params[:ingredients]
    params.delete(:ingredients)
    r = Recipe.create(params)
    ingredients.each { |i| r.ingredients.create( name: i[:name]) }
    redirect "/recipes/#{r.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :"recipes/show"
  end
end
