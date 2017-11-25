class ReviewsController < ApplicationController

  get '/reviews' do
    @reviews = Review.all
    erb :'/reviews/index'
  end

  get '/reviews/new' do
    erb :'/reviews/new'
  end

  post '/reviews/create' do
    @review = Review.create(review_params)
    @restaurant = Restaurant.find_by(phone: restaurant_params[:phone])
    @restaurant ||= Restaurant.create(restaurant_params)
    @review.restaurant = @restaurant
    @chowtable = Chowtable.find_or_create_by(chowtable_params)
    @chowtable.restaurant = @restaurant
    @review.chowtable = @chowtable
    # change from (name: params[:user_name]) to (session[:user_id]) when authentication is implemented
    @user = User.find_or_create_by(name: params[:user_name])
    @review.user = @user
    @restaurant.save
    @chowtable.save
    @user.save
    @review.save
    redirect "/reviews"
  end

  # get '/reviews/:id' do
  #   @review = Review.find(params[:id])
  #   erb :'/reviews/show'
  # end

  get '/reviews/:id/edit' do
    @review = Review.find(params[:id])
    erb :'/reviews/edit'
  end

  patch '/reviews/:id' do
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect "/reviews"
  end

  get '/reviews/:id/delete' do
    @review = Review.find(params[:id])
    @review.delete_all
    redirect '/reviews'
  end

  private

  def review_params
    {content: params[:content], wobble: params[:wobble].to_i}
  end

  def restaurant_params
    {name: params[:restaurant_name], phone: params[:restaurant_phone], street_address: params[:street_address], city: params[:city], state: params[:state], zipcode: params[:zipcode]}
  end

  def chowtable_params
    {number: params[:table_number], table_type: params[:table_type]}
  end

  def user_params
    {name: params[:user_name]}
  end

end
