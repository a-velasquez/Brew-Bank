class BeersController < ApplicationController
  before_action :set_beer, only: [:show, :edit, :update]
  before_action :beer_author, only: [:edit, :update]

  def new
    if logged_in?
      @beer = Beer.new 
      @beer.build_category
    else
      redirect_if_not_logged_in
    end
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
    if @category = Category.find_by_id(params[:category_id]) 
      @beers = @category.beers
    elsif @user = User.find_by_id(params[:user_id])
      @beers = @user.beers 
    else
      @beers = Beer.all.alphabetical
    end 
  end
  
  def show
  end

  def edit 
  end
  
  def update 
    if @beer.update(beer_params)
      redirect_to beer_path(@beer)
    else
      render :edit 
    end
  end

  private 

  def beer_params
    params.require(:beer).permit(:name, :brewer, :alcohol, :description, :category_id, category_attributes: [:name])
  end

  def set_beer
    @beer = Beer.find_by_id(params[:id])
  end

  def beer_author
    if @beer.user != current_user
      flash[:error] = 'You Can Only Edit Your Own Beers!'
      redirect_to beers_path 
    end
  end
end
