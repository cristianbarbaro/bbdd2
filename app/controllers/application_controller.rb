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

    def authorized_admin
      return unless !current_user.has_role? :admin
      redirect_to root_path, notice: 'Only administrator user has permission.'
    end 

    def update_model(model, model_params, path)
      begin
        if model.update(model_params)
          flash[:success] = "#{model.class.name} was successfully updated."
          redirect_to path
        else
          render :edit
        end
      rescue ActiveRecord::StaleObjectError
        model.reload.attributes = model_params.reject do |attrb, value|
          attrb.to_sym == :lock_version
        end
        flash[:danger] = "Another user has made a change to that record "+
          "since you accessed the edit form."
        render :edit, :status => :conflict
      end
    end

end
