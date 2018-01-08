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
        flash[:message] = "Username and password cannot be blank"
        redirect '/users/signup'
    end
  end

  get '/users/reviews' do
    if @user.admin?
      redirect '/reviews'
    else
      erb :'/users/reviews'
    end
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
      flash[:message] = "Invalid username and/or password"
      redirect '/users/login'
    end
  end

  get '/users/logout' do
    session.clear
    session[:id] = nil
    flash[:message] = "You have logged out."
    redirect '/users/home'
  end

end
