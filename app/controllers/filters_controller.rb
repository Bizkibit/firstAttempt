class FiltersController < ApplicationController

  def create
    # filter_params = params.require(:filter).permit(:address, :radius)
    filter_params = params.require(:filter).permit(:name)
    @filter = Filter.new filter_params
    redirect_to nearby_organizations_path(@filter)
  end


end
