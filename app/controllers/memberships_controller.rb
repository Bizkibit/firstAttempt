class MembershipsController < ApplicationController

  def update
    @membership = OrgMembership.find(params[:org_membership_id])

    if params[:id] == '1'
      @membership.approve
      @membership.save
      flash[:notice] = 'Membership approved'
      # redirect_to organization_path(@membership.organization)
    else
      @membership.reject
      @membership.save
      flash[:notice] = 'Membership rejected'
    end

    redirect_to organization_path(@membership.organization)
  end

end
