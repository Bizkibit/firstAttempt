class EventsController < ApplicationController

  def new
    @organization = Organization.find(params[:organization_id])
    @event = Event.new
  end

  def create
    @organization = Organization.find(params[:organization_id])
    @event = Event.new event_params
    @event.organization = @organization
    if @event.save
      flash[:notice] = 'Event created!'
      redirect_to organization_path(@organization)
    else
      flash[:alert] = 'Event creation Error'
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
  end

  def destroy
    @organization = Organization.find(params[:organization_id])
    event = @organization.event
    event.destroy
    flash[:notice] = 'Event cancelled'
    redirect_to organization_path(@organization)
  end

  private

  def event_params
    params.require(:event).permit(:start_date, :end_date, :start_time, :end_time, :details, :spots)
  end

end
