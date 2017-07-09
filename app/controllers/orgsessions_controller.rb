class OrgsessionsController < ApplicationController
  def new
  end

  def create

    organization = Organization.find_by(name: params[:name])


    if organization&.authenticate(params[:password])
      session[:organization_id] = organization.id
      redirect_to organizations_path, notice: 'Thank you for signing in!'
    else

      flash.now[:alert] = 'Wrong credentials!'
      render :new
    end
  end

  def destroy
    session[:organization_id] = nil
    redirect_to organizations_path, notice: 'Signed Out!'
  end

end
