module BeersHelper

  def beer_index_header(category)
    if params[:category_id]
      content_tag(:div, "All #{ category.name } Beers")
    elsif params[:user_id] 
      content_tag(:div, "All of Your Beers")
    else
      content_tag(:div, "All Beers")
    end
  end
end