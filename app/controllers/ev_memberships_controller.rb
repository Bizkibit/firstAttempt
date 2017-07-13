class EvMembershipsController < ApplicationController

  def create
    event = Event.find(params[:event_id])
    event.attendees << current_user
    redirect_to organization_path(event.organization)
  end

  def destroy
    event = Event.find(params[:event_id])
    event.attendees.destroy(current_user)
    redirect_to organization_path(event.organization)
  end

end
