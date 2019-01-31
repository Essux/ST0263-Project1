include SessionsHelper

class LocationsController < ApplicationController
    def create
        @route = current_user.routes.find_by(id: params[:route_id])
        if @route.nil?
            redirect_to current_user
        end
        long = rand(180.0)
        lat = rand(90.0)
        @location = @route.locations.build(longitude: long, latitude: lat)
        @location.save
        redirect_to @route
    end
end
