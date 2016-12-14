class NrelService

  def self.get_stations_by_zip_code(zip)
    response = Faraday.get("http://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV["nrel_token"]}&location=#{zip}&radius=6.0&limit=10&fuel_type=ELEC,LPG")
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    parsed_response[:fuel_stations]
  end

end
