class TablesController < ApplicationController

  get '/tables' do
    @tables = Table.all
    erb :'/tables/index'
  end

  get '/tables/new' do
    # @tables = Table.new <-- not necessary unless you are using data from Tables
    erb :'/tables/new'
  end

  post '/tables/create' do
    @table = Table.create(table_params)
    # save or create new title section
    if params[:table][:title_ids]
      params[:table][:title_ids].each do |title_id|
        @table.titles << Title.find(title_id)
      end
    end
    @table.titles << Title.find_or_create_by!(name: params[:title][:name]) unless params[:title][:name].empty?
    # save or create new landmark section
    if params[:table][:landmark_ids]
      params[:table][:landmark_ids].each do |landmark_id|
        @table.landmarks << Landmark.find(landmark_id)
      end
    end
    @table.landmarks << Landmark.find_or_create_by!(name: params[:landmark][:name]) unless params[:landmark][:name].empty?
    # save and redirect
    @table.save
    redirect :'/tables'
  end

  get '/tables/:id' do
    @table = Table.find(params[:id])
    erb :'/tables/show'
  end

  get '/tables/:id/edit' do
    @table = Table.find(params[:id])
    erb :'/tables/edit'
  end

  patch '/tables/:id' do
    @table = Table.find(params[:id])
    @table = @table.update(table_params)
    # save or create new title section
    if params[:table][:title_ids]
      params[:table][:title_ids].each do |title_id|
        @table.titles << Title.find(title_id)
      end
    end
    @table.titles << Title.find_or_create_by!(name: params[:title][:name]) unless params[:title][:name].empty?
    # save or create new landmark section
    if params[:table][:landmark_ids]
      params[:table][:landmark_ids].each do |landmark_id|
        @table.landmarks << Landmark.find(landmark_id)
      end
    end
    @table.landmarks << Landmark.find_or_create_by!(name: params[:landmark][:name]) unless params[:landmark][:name].empty?
    # save and redirect
    @table.save
    redirect :"/tables/#{@table.id}"
  end

  private

  def table_params
    {name: params[:table][:name]}
    # {name: params[:table][:name], titles: params[table][title_ids][], landmarks: params[table][landmark_ids][]}
  end

end
