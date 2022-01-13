class MapsFacade
  class << self
    def static_map(address)
      parsed_response = MapsService.get_image(address)
      string_url = parsed_response[:results][0][:locations][0][:mapUrl]
      string_url.sub("|", "%7C")
    end
  end
end
