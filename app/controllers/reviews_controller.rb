class ReviewsController < ApplicationController 

  def new 
    @beer = Beer.find_by_id(params[:beer_id])
    @review = @beer.reviews.build
  end

  def create 
    
    @review = current_user.reviews.build(review_params)
    binding.pry
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
    if authorized?(@review)
      render :show
    else 
      redirect_to reviews_path(current_user)
    end
  end

  def index 
  end

  private 

  def review_params
    params.require(:review).permit(:title, :rating, :content, :beer_id)
  end


end
