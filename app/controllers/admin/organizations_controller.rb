class Admin::OrganizationsController < Admin::BaseController

  def index
    @organizations = Organization.order(created_at: :desc)
    @pending = Organization.where(aasm_state: 'pending')
    @approved = Organization.where(aasm_state: 'approved')
    @rejected = Organization.where(aasm_state: 'rejected')
  end

  def update
    @organizations = Organization.all
    @organization = Organization.find(params[:organization_id])
    if params[:id] == '1'
      @organization.approve
      @organization.save
      flash[:notice] = 'Membership approved'
      redirect_to organization_admin_organizations_path
    else
      @organization.reject
      @organization.save
      flash[:notice] = 'Membership rejected'
      redirect_to organization_admin_organizations_path
    end
  end

end
