class BeersController < ApplicationController
  
  def new 
    @beer = Beer.new 
    @beer.build_category
  end

  def create 
    @beer = current_user.beers.build(beer_params)
    if @beer.save 
      redirect_to beer_path(@beer)
    else
      @beer.build_category
      render :new 
    end
  end
  
  def index 
    @beers = Beer.all.order_by_name 
  end
  
  def show
    @beer = Beer.find_by_id(params[:id]) 
  end

  private 

  def beer_params
    params.require(:beer).permit(:name, :brewer, :alcohol, :description, :category_id, category_attributes: [:name])
  end

end
