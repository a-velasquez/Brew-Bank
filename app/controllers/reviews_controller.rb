class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :review_author, only: [:edit, :update, :destroy]
  

  def new
    if logged_in? 
      if @beer = Beer.find_by_id(params[:beer_id])
        @review = @beer.reviews.build
      else
        @review = Review.new 
      end
    else
      redirect_if_not_logged_in
    end
  end

  def create  
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to review_path(@review)
    else 
      render :new 
    end 
  end 

  def show
  end

  def index
    if @beer = Beer.find_by_id(params[:beer_id]) #nested route
      @reviews = @beer.reviews 
    else  
      @reviews = Review.all.order_by_rating #un-nested route
    end
  end

  def edit 
  end

  def update 
    if @review.update(review_params)
      redirect_to review_path(@review)
    else
      render :edit 
    end 
  end

  def destroy
    @review.destroy
    redirect_to reviews_path
  end

  private 

    def review_params
      params.require(:review).permit(:title, :rating, :content, :beer_id)
    end

    def set_review
      @review = Review.find_by_id(params[:id])  
    end

    def review_author
      if @review.user != current_user
        flash[:error] = "You Can Only Edit Your Own Reviews!"
        redirect_to reviews_path 
      end
    end
end
