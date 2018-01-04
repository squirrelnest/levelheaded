class UsersController < ApplicationController

  get '/users/home' do
    @user = User.find_by(id: session[:id])
    erb :'/users/home'
  end

  get '/users/signup' do
    erb :'/users/signup'
  end

  post '/users/registration' do
    @user = User.new(name: params["username"], password: params["password"])
    @user.save
    session[:id] = @user.id
    redirect '/users/reviews'
  end

  get '/users/reviews' do
    @user = User.find(session[:id])
    erb :'/users/reviews'
  end

  get '/users/login' do
    erb :'/users/login'
  end

  post '/users/session' do
    @user = User.find_by(user_params)
    session[:id] = @user.id
    redirect :'/users/reviews'
  end

  get '/users/logout' do
    session.clear
    erb :'users/logout'
  end

  private

  def user_params
    {name: params["username"], password: params["password"]}
  end

end
