module ReviewsHelper

  def review_form_header(review)
    if params[:beer_id]
      content_tag(:div, "Add a Review for #{review.beer.name}")
    else
      content_tag(:div, "Add a Review")
    end
  end

  def review_index_header(beer)
    if params[:beer_id]
      content_tag(:div, "All Reviews for #{beer.name}") 
    else
      content_tag(:div, "All Reviews")
    end
  end
end