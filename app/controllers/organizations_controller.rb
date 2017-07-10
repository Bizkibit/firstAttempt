class OrganizationsController < ApplicationController

  def new
    @organization = Organization.new
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

    @pending_memberships = @organization.org_memberships.where(aasm_state: 'pending')
    @approved_memberships = @organization.org_memberships.where(aasm_state: 'approved')
    @rejected_memberships = @organization.org_memberships.where(aasm_state: 'rejected')
    @memberships = @organization.org_memberships

    @event = @organization.event

  end

  def index
    @organizations = Organization.all
  end

  def edit
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :first_name, :last_name, :website, :email, :phone, :password, :password_confirmation)
  end
end
