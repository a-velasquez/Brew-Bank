class ReviewsController < ApplicationController 

  def new 
    @beer = Beer.find_by_id(params[:beer_id])
    @review = @beer.reviews.build
  end


end
