module ReviewsHelper

  def display_header(review)
    if params[:beer_id]
        content_tag(:h1, "Add a Review for #{review.beer.name}")
    else
      content_tag(:h1, "Add a Review")
    end
  end
end