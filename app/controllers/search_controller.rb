class SearchController < ApplicationController

  def index
    response = Faraday.get("http://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV["nrel_token"]}&location=80203&radius=6.0&limit=10&fuel_type=ELEC,LPG")
    binding.pry
  end

end 
