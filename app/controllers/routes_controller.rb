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
    end
end
