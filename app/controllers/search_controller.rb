class SearchController < ApplicationController

  def index
    @stations = Station.find_stations_by_zip_code(params[:q])
  end

end
