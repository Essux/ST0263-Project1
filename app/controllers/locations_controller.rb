include SessionsHelper

class LocationsController < ApplicationController
    def create
        @route = current_user.routes.find_by(id: params[:route_id])
        if @route.nil?
            redirect_to current_user
        end

        lat_long = params.permit(:latitude, :longitude)

        @location = @route.locations.build(lat_long)
        @location.save
        redirect_to @route
    end
end
