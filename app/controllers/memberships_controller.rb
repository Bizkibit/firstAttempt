class MembershipsController < ApplicationController


  # def rej
  # end
  #
  # def apr
  #   if params[:id] == 1
  #     @membership = OrgMembership.find(params[:org_membership_id])
  #     @membership.approve
  #     render[:notice] = 'Membership approved'
  #     redirect_to organization_path(@membership.organization)
  #   else
  #   end
  # end

  def update
    @membership = OrgMembership.find(params[:org_membership_id])
    if params[:id] == '1'
      @membership.approve
      @membership.save
      flash[:notice] = 'Membership approved'
      redirect_to organization_path(@membership.organization)
    else
      @membership.reject
      @membership.save
      flash[:notice] = 'Membership rejected'
      redirect_to organization_path(@membership.organization)
    end
  end

end
