class Station

  def initialize(attributes)
    @name = attributes[:station_name]
    @address = attributes[:street_address]
    @fuel_type = attributes[:fuel_type_code]
    @distance = attributes[:distance]
    @access_time = attributes[:access_days_time]
    binding.pry
  end

end
