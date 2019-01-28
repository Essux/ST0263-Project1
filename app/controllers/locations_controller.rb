class LocationsController < ApplicationController
  include SessionsHelper

  before_action :logged_in_user, only: [:new]
  
  def new
    @location = current_user.locations.build
  end

  def create
    @location = current_user.locations.build(params.require(:location).permit(:longitude, :latitude))
    if @location.save
      redirect_to current_user
    else
      render 'new'
    end
  end

  private
  
    def correct_user
      @location = current_user.locations.find_by(id: params[:id])
      if @location.nil?
        redirect_to current_user
      end
    end

    def logged_in_user
      unless logged_in?
        redirect_to root_url
      end
    end
end
