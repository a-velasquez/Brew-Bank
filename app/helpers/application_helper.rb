module ApplicationHelper

  def navigation_links
    render partial: 'layouts/logged_in' if logged_in?
  end

end
