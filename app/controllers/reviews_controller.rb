class ReviewsController < ApplicationController

  get '/reviews' do
    @reviews = Review.all
    erb :'/reviews/index', layout: :'/_layouts/layout'
  end

  get '/reviews/new' do
    erb :'/reviews/new'
  end

  post '/reviews/create' do
    @review = Review.create(review_params)
    @review.save
    redirect "/reviews/#{@review.id}"
  end

  get '/reviews/:id' do
    @review = Review.find(params[:id])
    erb :'/reviews/show'
  end

  get '/reviews/:id/edit' do
    @review = Review.find(params[:id])
    erb :'/reviews/edit'
  end

  patch '/reviews/:id' do
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect "/reviews/#{@review.id}"
  end

  private

  def review_params
    {name: params[:review][:name], year_completed: params[:review][:year_completed]}
  end

end
