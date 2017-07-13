class OrgMembershipsController < ApplicationController

  # create action is only used by the user
  def create
    @organization = Organization.find(params[:organization_id])
    om_params = params.require(:org_membership).permit(:detail)
    # @org_membership = OrgMembership.new(user: current_user, organization: @organization)
    @org_membership = OrgMembership.new om_params
    @org_membership.user = current_user
    @org_membership.organization = @organization
    if @org_membership.save
      flash[:notice] = 'Your request has been sent'
    else
      flash[:alert] = 'an Error has occured'
    end
    redirect_to organization_path(@organization)
  end

  # def edit
  # end
  #
  #
  # def update
  #   org_membership = OrgMembership.find(params[:id])
  # end

  # destroy action is only usable by the user
  def destroy
    @organization = Organization.find(params[:organization_id])
    # org_membership = @organization.members.find(session[:user_id])
    org_membership = @organization.org_memberships.find_by(user: current_user)

    if org_membership.destroy
      flash[:notice] = 'Request cancelled'
    else
      flasg[:alert] = 'Error'
    end
    redirect_to organization_path(@organization)
  end

end
