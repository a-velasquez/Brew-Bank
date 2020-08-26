class CategoriesController < ApplicationController 

  def index 
    @categories = Category.all.alphabetical 
  end

  def show 
    @category = Category.find_by_id(params[:id])
  end

end
