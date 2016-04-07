class UsersController < ApplicationController

  before_action :authenticate_user!

  # Only users and admins can edit user's profile
  def edit
  end

  def show
     @user = User.find(params[:id])
  end

  # Only users and admins can update user's profile
  def update
    if current_user.update_attributes(user_params)
      redirect_to edit_user_registration_path
  end

  private
    # Using a private method to encapsulate the permissable parameters

    # Finds the User with the ID stored in the session with the key 
    # :current_user_id. Logging in sets the session value and logging
    # out removes it.
    def current_user
      @current_user || = session[:current_user_id] &&
        User.find_by(id: session[:current_user_id])
      end
    end

    def user_params
      params.require(:user).permit(:section, :category, :post)
    end

    def current_user_only
      unless current_user == current_user || current_user.admin?
        flash[:alert] = "Access denied..you can only update your own profile."
        redirect_to root_path
      end
    end

end

# Using informtion from http://guides.rubyonrails.org/action_controller_overview.html
# Trying to put all the user controller info together, but I don't think we have all info in the users table and i'm not sure if this will throw an error or not.
=======
  def show
    @user = User.find(params[:id])
  end

end

