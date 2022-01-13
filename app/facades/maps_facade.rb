class MapsFacade 
  class << self 
    def get_street_view_image(address)
      MapsService.get_image(address)
      #get the image url string here 
    end 
  end 
end 