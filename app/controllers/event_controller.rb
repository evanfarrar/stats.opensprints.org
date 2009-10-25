# This controller is deprecated, but is here for preserve routing. Only used for links to one event by Dylan in Dallas.
class EventController < ApplicationController
  def show
    @user = User.find_by_group_name_for_url(params[:group_name])
    redirect_to data_upload_event_path(@user.data_uploads.last.id,params[:id])
  end
end
