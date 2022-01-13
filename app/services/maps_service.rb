class MapsService
  class << self
    def get_image(address)
      response = conn.get("maps/api/streetview?location=4835 irving st, denver, co 80221&size=600x1000")
      binding.pry
    end 

    # https://maps.googleapis.com/maps/api/streetview/?location=4835 irving st, denver, co 80221&size=600x1000&key=AIzaSyBbOSmRFIR-SdFOYoehsAot6Kk9eWbK3YI not found
    # https://maps.googleapis.com/maps/api/streetview?location=4835 irving st, denver, co 80221&size=600x1000&key=AIzaSyBbOSmRFIR-SdFOYoehsAot6Kk9eWbK3YI
  
    private 

    def conn
      Faraday.new("https://maps.googleapis.com") do |x|
        x.params['key'] = ENV['maps_api_key']
      end 
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end 
end 