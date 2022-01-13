class MapsFacade
  class << self
    def static_map(address)
      MapsService.get_image(address)
      require "pry"; binding.pry
    end
  end
end
