class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def user_signed_in?
    if session[:user_id].present? && current_user.nil?
      session[:user_id] = nil
    end
    session[:user_id].present?
  end
  helper_method :user_signed_in?

  def organization_signed_in?
    if session[:organization_id].present? && current_organization.nil?
      session[:organization_id] = nil
    end
    session[:organization_id].present?
  end
  helper_method :organization_signed_in?


  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user

  def current_organization
    @current_organization ||= Organization.find_by(id: session[:organization_id])
  end
  helper_method :current_organization

  def approved_memberships
    current_user.org_memberships.where(aasm_state: 'approved')
  end
  helper_method :approved_memberships

  def approved_members
    current_organization.org_memberships.where(aasm_state: 'approved')
  end
  helper_method :approved_members

  def authenticate_user!
    if !user_signed_in?
      redirect_to new_session_path, notice: 'Please sign in!'
    end
  end

  def authenticate_organization!
    if !organization_signed_in?
      redirect_to new_session_path, notice: 'Please sign in!'
    end
  end

end
