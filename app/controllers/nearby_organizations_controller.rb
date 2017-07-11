class NearbyOrganizationsController < ApplicationController
  def index
   @organization =  Organization.near([49.2819605,-123.1086604], 1000)
   @hash = Gmaps4rails.build_markers(@organization) do |organization, marker|
     marker.lat organization.latitude
     marker.lng organization.longitude
     marker.infowindow organization.name
    end
   end
end
