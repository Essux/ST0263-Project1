include SessionsHelper

class LocationsController < ApplicationController
    def create
        @route = current_user.routes.find_by(id: params[:route_id])
        if @route.nil?
            redirect_to current_user
        end

        ip = request.remote_ip
        location = Geocoder.search(ip)[0]
        
        if location.longitude.nil?
            long = rand(180.0)
        else
            long = location.longitude
        end

        if location.longitude.nil?
            lat = rand(90.0)
        else
            lat = location.latitude
        end

        @location = @route.locations.build(longitude: long, latitude: lat)
        @location.save
        redirect_to @route
    end
end
