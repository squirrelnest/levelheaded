class UsersController < ApplicationController

  get '/users/home' do
    @user = User.find(session[:id])
    erb :'/users/home'
  end

  get '/users/signup' do
    erb :'/users/signup'
  end

  post '/users/registration' do
    @user = User.new(name: params["username"], password: params["password"])
    @user.save
    session[:id] = @user.id
    redirect '/users/home'
  end

  get '/users/login' do
    erb :'/users/login'
  end

  # get '/users' do
  #   @users = User.all
  #   erb :'/users/index'
  # end
  #
  # get '/users/new' do
  #   erb :'/users/new'
  # end
  #
  # post '/users/create' do
  #   @user = User.create(user_params)
  #   @user.save
  #   redirect "/users/#{@user.id}"
  # end
  #
  # get '/users/:id' do
  #   @user = User.find(params[:id])
  #   erb :'/users/show'
  # end
  #
  # get '/users/:id/edit' do
  #   @user = User.find(params[:id])
  #   erb :'/users/edit'
  # end
  #
  # patch '/users/:id' do
  #   @user = User.find(params[:id])
  #   @user.update(user_params)
  #   redirect "/users/#{@user.id}"
  # end

  private

  def user_params
    {name: params[:user][:name]}
  end

end
