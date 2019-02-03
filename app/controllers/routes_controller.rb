class RoutesController < ApplicationController
    include SessionsHelper

    def create
        @route = current_user.routes.build
        if @route.save
            redirect_to @route
        else
            redirect_to current_user
        end
    end

    def show
        @route = current_user.routes.find_by(id: params[:id])
        if @route.nil?
            redirect_to current_user
        end
        @locations = @route.locations

        @latlngs = []
        @center_lat = 0.0
        @center_lon = 0.0
        @locations.each do |loc|
            @latlngs.push([loc.latitude, loc.longitude])
            @center_lat += loc.latitude
            @center_lon += loc.longitude
        end
        @center_lat /= @locations.count
        @center_lon /= @locations.count
    end
end
