class ChowtablesController < ApplicationController

  get '/chowtables' do
    @chowtables = Chowtable.all
    erb :'/chowtables/index'
  end

  delete '/chowtables/:id' do
    @chowtable = Chowtable.find(params[:id])
    if @user.admin?
      @chowtable.delete
      redirect '/chowtables'
    else
      redirect '/chowtables'
    end
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
