class SearchController < ApplicationController

  def index
    response = Faraday.get("http://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV["nrel_token"]}&location=#{params[:q]}&radius=6.0&limit=10&fuel_type=ELEC,LPG")
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    stations = parsed_response[:fuel_stations]
    @stations = stations.map do |station_info|
      Station.new(station_info)
    end
  end

end
