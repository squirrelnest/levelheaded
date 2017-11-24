class RestaurantsController < ApplicationController

  get '/restaurants' do
    @restaurants = Restaurant.all
    erb :'/restaurants/index', layout: :'/_layouts/layout'
  end

  get '/restaurants/new' do
    erb :'/restaurants/new'
  end

  post '/restaurants/create' do
    @restaurant = Restaurant.create(restaurant_params)
    @restaurant.save
    redirect "/restaurants/#{@restaurant.id}"
  end

  get '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    erb :'/restaurants/show'
  end

  get '/restaurants/:id/edit' do
    @restaurant = Restaurant.find(params[:id])
    erb :'/restaurants/edit'
  end

  patch '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect "/restaurants/#{@restaurant.id}"
  end

  private

  def restaurant_params
    {name: params[:restaurant][:name], year_completed: params[:restaurant][:year_completed]}
  end

end
