class MapsFacade
  class << self
    def static_map(address)
      parsed_response = MapsService.get_image(address)
      parsed_response[:results][0][:locations][0][:mapUrl]
    end
  end
end
