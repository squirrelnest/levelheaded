class ReviewsController < ApplicationController

  get '/reviews' do
    @reviews = Review.all
    erb :'/reviews/index', layout: :'/_layouts/layout'
  end

  get '/reviews/new' do
    erb :'/reviews/new', layout: :'/_layouts/layout'
  end

  post '/reviews/create' do
    @review = Review.create(review_params)
    @restaurant = Restaurant.find_or_create_by(restaurant_params)
    @review.restaurant = @restaurant
    @chowtable = Chowtable.find_or_create_by(chowtable_params)
    @review.chowtable = @chowtable
    @review.save
    redirect "/reviews/#{@review.id}"
  end

  # get '/reviews/:id' do
  #   @review = Review.find(params[:id])
  #   erb :'/reviews/show', layout: :'/_layouts/layout'
  # end

  get '/reviews/:id/edit' do
    @review = Review.find(params[:id])
    erb :'/reviews/edit', layout: :'/_layouts/layout'
  end

  patch '/reviews/:id' do
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect "/reviews"
  end

  private

  def review_params
    {content: params[:content], wobble: params[:wobble], table_type: params[:table_type]}
  end

  def restaurant_params
    {name: params[:restaurant_name], phone: params[:restaurant_phone], address_hash: params[:address][]}
  end

  def chowtable_params
    {number: params[:table]}
  end

end
