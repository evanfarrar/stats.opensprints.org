class ProfilesController < ApplicationController
  # this resource is a thin decoupling from the users controller
  # create, new and show are on the user controller.
  def create; redirect_to new_user_path; end
  def new; redirect_to new_user_path; end
  def show
    @user = User.find(params[:id])
    redirect_to group_path(@user.group_name_for_url)
  end

  before_filter :only_allow_users_to_edit_own_info, :only => [:edit,:update]

  def edit
  end
  def update
    @user.update_attributes(params[:user])
    redirect_to profile_path(@user)
  end

private
  def only_allow_users_to_edit_own_info
    @user = User.find(params[:id])
    unless current_user && (@user.id == current_user.id)
      flash[:errors] = "Not authorized"
      raise ActionController::Forbidden
    end
  end
end
