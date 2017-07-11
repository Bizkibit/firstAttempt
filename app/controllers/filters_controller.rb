class FiltersController < ApplicationController

  def create
    filter_params = params.require(:filter).permit(:address, :radius, :name)

    # filter_params = params.require(:filter).permit(:name)
    @filters = Filter.new filter_params
    @filters.save
    redirect_to nearby_organizations_path(@filters)
    # render json: params

  end


end
