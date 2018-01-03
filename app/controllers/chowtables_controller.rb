class ChowtablesController < ApplicationController

  get '/chowtables' do
    @chowtables = Chowtable.all
    erb :'/chowtables/index'
  end

  get '/chowtables/:id/delete' do
    @chowtable = Chowtable.find(params[:id])
    @chowtable.delete
    redirect '/chowtables'
  end

  get '/chowtables/:id' do
    @chowtable = Chowtable.find(params[:id])
    erb :'/chowtables/show'
  end

  private

  def chowtable_params
    {name: params[:chowtable][:name]}
  end

end
