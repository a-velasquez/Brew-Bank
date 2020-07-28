class BeersController < ApplicationController
  
  def show
    @beer = Beer.first 
  end


end
