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
  end

  before do
    @user = User.find(session[:user_id]) unless !session[:user_id]
  end

  get '/' do
    @recipes = Recipe.all
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

  get '/logout' do
    session[:user_id] = nil
    redirect "/"
  end

  get '/recipes' do
    redirect "/"
  end

  get '/recipes/new', auth: :user do
    erb :"recipes/new"
  end

  post '/recipes/new', auth: :user do
    name = params[:name]
    ingredients = params[:ingredients]
    instructions = params[:instructions]

    r = Recipe.create(
      name: name,
      user_id: @user.id,
      instructions: instructions
    )

    ingredients.each do |i|
      r.ingredients.create(
        quantity: i[:qty],
        name: i[:name]
      )
    end

    redirect "/recipes/#{r.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :"recipes/show"
  end

  run! if __FILE__ == $0
end
