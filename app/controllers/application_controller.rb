class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    private
        def set_farm
            @farm = Farm.find(params[:farm_id])
            head 403 unless current_user.farms.include?(@farm)
        end

        def set_plot
            @plot = @farm.plots.find(params[:plot_id])
        end
end
