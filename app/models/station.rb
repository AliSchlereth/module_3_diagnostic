class Station

  attr_reader :name,
              :address,
              :fuel_type,
              :distance,
              :access_time

  def initialize(attributes)
    @name = attributes[:station_name]
    @address = attributes[:street_address]
    @fuel_type = set_fuel_type(attributes[:fuel_type_code])
    @distance = attributes[:distance]
    @access_time = attributes[:access_days_time]
  end

  def set_fuel_type(fuel_code)
    return "Electric" if fuel_code == "ELEC"
    return "Propane" if fuel_code == "LPG"
  end

  def self.find_stations_by_zip_code(zip)
    service = NrelService.get_stations_by_zip_code(zip)
    process_station_data(service)
  end

  def self.process_station_data(service)
    @stations = service.map do |station_info|
      Station.new(station_info)
    end
  end

end
