class BeersController < ApplicationController
  before_action :redirect_if_not_logged_in, only: [:new, :create]
  
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
    if @category = Category.find_by_id(params[:category_id]) #nested route
      @beers = @category.beers
    elsif @user = User.find_by_id(params[:user_id])
      @beers = @user.beers 
    else
      @beers = Beer.all.alphabetical
    end 
  end
  
  def show
    @beer = Beer.find_by_id(params[:id]) 
  end

  private 

    def beer_params
      params.require(:beer).permit(:name, :brewer, :alcohol, :description, :category_id, category_attributes: [:name])
    end

end
