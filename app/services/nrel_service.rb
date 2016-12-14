class NrelService

  def initialize
    @token = ENV["nrel_token"]
    @conn = Faraday.new(url: "http://developer.nrel.gov") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params[:api_key] = @token
    end
  end

  def get_stations_by_zip_code(zip)
    response = @conn.get("api/alt-fuel-stations/v1/nearest.json?&location=#{zip}&radius=6.0&limit=10&fuel_type=ELEC,LPG")
    # response = Faraday.get("http://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV["nrel_token"]}&location=#{zip}&radius=6.0&limit=10&fuel_type=ELEC,LPG")
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    parsed_response[:fuel_stations]
  end

end
