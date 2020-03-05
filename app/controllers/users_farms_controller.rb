class UsersFarmsController < ApplicationController
  before_action :set_farm, only: [:new_user, :add_user, :destroy_user]

  # GET /farms/:farm_id/new_users
  def new_user
    render :new_user
  end

  # POST /farms/:farm_id/add_users
  def add_user
    @user = User.find(user_farm_params[:user_id])
    @farm.users << @user
    flash[:success] = "User added sucessfully."
    redirect_to @farm
  end

    # POST /farms/:farm_id/destroy_user
    def destroy_user
      @user = User.find(user_farm_params[:user_id])
      @farm.users.delete(@user)
      #farm.usersto_a - 
      flash[:success] = 'User was successfully removed.'
      redirect_to @farm
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farm
      @farm = Farm.find(params[:farm_id])
      head 403 unless current_user.farms.include?(@farm)
    end

    def user_farm_params
      params.require(:user).permit(:user_id)
    end
end