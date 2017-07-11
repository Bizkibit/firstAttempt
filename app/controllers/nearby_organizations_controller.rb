class NearbyOrganizationsController < ApplicationController
  def index
    @filter = Filter.new

    if !params[:format].present?
      @organization =  Organization.near([49.2819605,-123.1086604], 1)
    else
      @filters ||= Filter.find(params[:format])
      # user_coordinates = [current_user.latitude, current_user.longitude]
      filter_coordinates = [@filters.latitude, @filters.longitude]
      @organization =  Organization.near(filter_coordinates, @filters.radius.to_i)
   end
  #  @organization ||=  Organization.near([49.2819605,-123.1086604], 1)
   @hash = Gmaps4rails.build_markers(@organization) do |organization, marker|
     marker.lat organization.latitude
     marker.lng organization.longitude
     marker.infowindow organization.name
    end

   end
end
