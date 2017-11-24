class ChowtablesController < ApplicationController

  get '/chowtables' do
    @chowtables = Chowtable.all
    erb :'/chowtables/index', layout: :'/layouts/layout'
  end

  get '/chowtables/new' do
    # @chowtables = Chowtable.new <-- not necessary unless you are using data from Chowtables
    erb :'/chowtables/new'
  end

  post '/chowtables/create' do
    @chowtable = Chowtable.create(chowtable_params)
    # save or create new title section
    if params[:chowtable][:title_ids]
      params[:chowtable][:title_ids].each do |title_id|
        @chowtable.titles << Title.find(title_id)
      end
    end
    @chowtable.titles << Title.find_or_create_by!(name: params[:title][:name]) unless params[:title][:name].empty?
    # save or create new landmark section
    if params[:chowtable][:landmark_ids]
      params[:chowtable][:landmark_ids].each do |landmark_id|
        @chowtable.landmarks << Landmark.find(landmark_id)
      end
    end
    @chowtable.landmarks << Landmark.find_or_create_by!(name: params[:landmark][:name]) unless params[:landmark][:name].empty?
    # save and redirect
    @chowtable.save
    redirect :'/chowtables'
  end

  get '/chowtables/:id' do
    @chowtable = Chowtable.find(params[:id])
    erb :'/chowtables/show'
  end

  get '/chowtables/:id/edit' do
    @chowtable = Chowtable.find(params[:id])
    erb :'/chowtables/edit'
  end

  patch '/chowtables/:id' do
    @chowtable = Chowtable.find(params[:id])
    @chowtable = @chowtable.update(chowtable_params)
    # save or create new title section
    if params[:chowtable][:title_ids]
      params[:chowtable][:title_ids].each do |title_id|
        @chowtable.titles << Title.find(title_id)
      end
    end
    @chowtable.titles << Title.find_or_create_by!(name: params[:title][:name]) unless params[:title][:name].empty?
    # save or create new landmark section
    if params[:chowtable][:landmark_ids]
      params[:chowtable][:landmark_ids].each do |landmark_id|
        @chowtable.landmarks << Landmark.find(landmark_id)
      end
    end
    @chowtable.landmarks << Landmark.find_or_create_by!(name: params[:landmark][:name]) unless params[:landmark][:name].empty?
    # save and redirect
    @chowtable.save
    redirect :"/chowtables/#{@chowtable.id}"
  end

  private

  def chowtable_params
    {name: params[:chowtable][:name]}
    # {name: params[:chowtable][:name], titles: params[chowtable][title_ids][], landmarks: params[chowtable][landmark_ids][]}
  end

end
