class UsersController < ApplicationController

  get '/users' do
    @users = User.all
    erb :'/users/index', layout: :'/_layouts/layout'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users/create' do
    @user = User.create(user_params)
    @user.save
    redirect "/users/#{@user.id}"
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'/users/show'
  end

  get '/users/:id/edit' do
    @user = User.find(params[:id])
    erb :'/users/edit'
  end

  patch '/users/:id' do
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect "/users/#{@user.id}"
  end

  private

  def user_params
    {name: params[:user][:name], year_completed: params[:user][:year_completed]}
  end

end
