class BeersController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new 
    @beer = Beer.new 
    @beer.build_category
  end

  def create 
    @beer = Beer.new(beer_params)
    if @beer.save 
      redirect_to beer_path(@beer)
    else
      render :new 
    end
  end
  
  def index 
    @beers = Beer.all 
  end
  
  def show
    @beer = Beer.find_by_id(params[:id]) 
  end

  private 

  def beer_params
    params.require(:beer).permit(:name, :brewer, :alcohol, :description, :category_id, category_attributes: [:name])
  end

end
