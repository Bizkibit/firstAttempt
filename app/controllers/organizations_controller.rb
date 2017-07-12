class OrganizationsController < ApplicationController

  def new
    @organization = Organization.new
    # 2.times { @organization.events.build }
  end

  def create
    @organization = Organization.new organization_params
    if @organization.save
      session[:organization_id] = @organization.id
      redirect_to organization_path(@organization)
    else
      render :new
    end
  end

  def show
    @organization = Organization.find(params[:id])

    @review = Review.new
    @reviews = @organization.reviews.order(created_at: :desc)

    #to calculate the review average for each organization
    @kir = 0
      if !@reviews.empty?
        @reviews.each do |r|
          @kir+= r.star.to_i
        end
        @kir=@kir/@reviews.count
      end

    # to make an application request form
    @org_membership = OrgMembership.new

    #used in the organization membership panel
    @pending_memberships = @organization.org_memberships.where(aasm_state: 'pending')
    @approved_memberships = @organization.org_memberships.where(aasm_state: 'approved')
    @rejected_memberships = @organization.org_memberships.where(aasm_state: 'rejected')
    @memberships = @organization.org_memberships

    @events = @organization.events
  end

  def index
    @filter = Filter.new
    @organizations = Organization.all
    @organization =  Organization.near([49.2819605,-123.1086604], 1000)
    @hash = Gmaps4rails.build_markers(@organization) do |organization, marker|
      marker.lat organization.latitude
      marker.lng organization.longitude
      marker.infowindow organization.name
     end
  end

  def edit
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :first_name, :last_name, :website, :email, :phone, :password, :password_confirmation, :address, :additional, pictures: [],  events_attributes: [:start_date,
                                                                          :end_date,
                                                                          :start_time,
                                                                          :end_time,
                                                                          :spots,
                                                                          :details ] )
  end


end
