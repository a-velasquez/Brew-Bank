module ApplicationHelper

  def navigation_links
    if logged_in?
      render partial: 'layouts/logged_in'
    else
      render partial: 'layouts/logged_out'
    end 
  end

end
