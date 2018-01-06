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
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    # if chowtable exists, use its existing restaurant as @restaurant
    if @chowtable
      @restaurant = @chowtable.restaurant
    end
    # if chowtable doesn't exist but restaurant does, create new chowtable, attach it to existing restaurant, assign @restaurant
    if @chowtable == nil && @restaurant
      @chowtable = Chowtable.create(chowtable_params)
      @chowtable.restaurant = @restaurant
      @chowtable.save
    end
    # if neither chowtable nor restaurant exist, create new chowtable and new restaurant
    if @chowtable == nil && @restaurant == nil
      @restaurant = Restaurant.new(restaurant_params)
      @restaurant.save
      @chowtable = Chowtable.new(chowtable_params)
      @chowtable.restaurant = @restaurant
      @chowtable.save
    end
    # attach chowtable and restaurant to review
    @review.chowtable = @chowtable
    @review.restaurant = @restaurant
    @review.save
    redirect "/tables/#{@chowtable.id}"
  end

  get '/reviews/:id/edit' do
    @review = Review.find(params[:id])
    erb :'/reviews/edit'
  end

  patch '/reviews/:id' do
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect "/users/reviews"
  end

  get '/reviews/:id/delete' do
    @review = Review.find(params[:id])
    if session[:id] == @review.user.id
      @review.delete
    end
    redirect '/users/reviews'
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
