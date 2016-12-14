require "rails_helper"

describe "NrelService" do
  context ".get_stations_by_zip_code" do
    it "returns a has of station information" do
      stations = NrelService.get_stations_by_zip_code(60175)

      expect(stations).to be_a(Array)
      expect(stations[0]).to have_key(:station_name)
      expect(stations[0]).to have_key(:street_address)
      expect(stations[0]).to have_key(:fuel_type_code)
      expect(stations[0]).to have_key(:distance)
      expect(stations[0]).to have_key(:access_days_time)
    end
  end
end
