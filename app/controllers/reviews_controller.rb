class ReviewsController < ApplicationController 

  def new 
    if @beer = Beer.find_by_id(params[:beer_id])
      @review = @beer.reviews.build
    else
      @review = Review.new 
    end
  end

  def create  
    @review = current_user.reviews.build(review_params)
    if @review.save 
      flash[:message] = "Review Successfully Saved!"
      redirect_to review_path(@review)
    else 
      flash[:error] = "Review Was Not Saved. Please Try Again."
      render :new 
    end 
  end 

  def show
    @review = Review.find_by_id(params[:id])
  end

  def index
    if @beer = Beer.find_by_id(params[:beer_id]) #nested route
      @reviews = @beer.reviews 
    else  
      @reviews = Review.all #un-nested route
    end
  end

  def edit 
    @review = Review.find_by_id(params[:id])
  end

  def update 
    @review = Review.find_by_id(params[:id])
    if @review.update (review_params)
      redirect_to review_path(@review)
    else
      render :edit 
    end 
  end

  private 

  def review_params
    params.require(:review).permit(:title, :rating, :content, :beer_id)
  end
end
