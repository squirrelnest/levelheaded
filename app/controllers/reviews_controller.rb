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
    @review.user_id = session[:id]
    @chowtable = Chowtable.find_by(id: params[:table_id])
    @restaurant = Restaurant.find(@chowtable.restaurant_id)
    unless @chowtable
      @chowtable = Chowtable.create(chowtable_params)
      @chowtable.save
      unless @restaurant
        @restaurant = Restaurant.create(restaurant_params)
        @restaurant.save
      end
    end
    @chowtable.restaurant = @restaurant
    @review.restaurant = @restaurant
    @review.chowtable = @chowtable
    @review.save
    redirect "/reviews"
  end

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
    if session[:id] == @review.user.id
      @review.delete
    end
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

end
