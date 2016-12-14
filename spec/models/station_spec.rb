require "rails_helper"

describe "Station" do
  context "#set_fuel_type" do
    it "renames fuel type by ELEC" do
      station = Station.new({:access_days_time=>"24 hours daily", :fuel_type_code=>"ELEC", :station_name=>"UDR", :street_address=>"800 Acoma St", :distance=>0.3117})
      type = station.set_fuel_type("ELEC")

      expect(type).to eq("Electric")
    end
    it "renames fuel type by LPG" do
      station = Station.new({:access_days_time=>"24 hours daily", :fuel_type_code=>"LPG", :station_name=>"UDR", :street_address=>"800 Acoma St", :distance=>0.3117})
      type = station.set_fuel_type("LPG")

      expect(type).to eq("Propane")
    end
  end

  context "#find_stations_by_zip_code" do
    it "returns an array of stations" do
      stations = Station.find_stations_by_zip_code(80203)

      expect(stations).to be_a(Array)
      expect(stations[0]).to be_a(Station)
      expect(stations[0].name).to be_truthy
      expect(stations[0].address).to be_truthy
      expect(stations[0].fuel_type).to be_truthy
      expect(stations[0].distance).to be_truthy
      expect(stations[0].access_time).to be_truthy
    end
  end

  context ".process_station_data" do
    it "translates station JSON to station objects" do
      service = NrelService.get_stations_by_zip_code(60175)
      stations = Station.process_station_data(service)

      expect(stations).to be_a(Array)
      expect(stations[0]).to be_a(Station)
    end
  end
end
