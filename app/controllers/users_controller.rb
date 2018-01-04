class UsersController < ApplicationController

  get '/users/home' do
    erb :'/users/home'
  end

  get '/users/signup' do
    erb :'/users/signup'
  end

  post '/users/registration' do
    @user = User.new(name: params["username"], password: params["password"])
    if @user
        @user.save
        session[:id] = @user.id
        redirect '/users/reviews'
    else
        redirect '/failure'
    end
  end

  get '/users/reviews' do
    @user = User.find(session[:id])
    erb :'/users/reviews'
  end

  get '/users/login' do
    erb :'/users/login'
  end

  post '/users/session' do
    @user = User.find_by(name: params["username"])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect '/users/reviews'
    else
      redirect '/failure'
    end
  end

  get '/users/logout' do
    session.clear
    session[:id] = nil
    erb :'users/logout'
    redirect '/users/home'
  end

end
