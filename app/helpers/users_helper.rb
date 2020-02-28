module UsersHelper
  def change_roles(params)
    if user_params[:admin] == "1"
      @user.add_role :admin
    elsif user_params[:admin] == "0"
      @user.remove_role :admin
    end
  end
end
