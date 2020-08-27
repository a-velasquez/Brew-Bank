module ReviewsHelper

  def reviews_index_header(review)
    if params[:beer_id]
      content_tag(:div, "Add a Review for #{review.beer.name}")
    else
      content_tag(:div, "Add a Review")
    end
  end
end