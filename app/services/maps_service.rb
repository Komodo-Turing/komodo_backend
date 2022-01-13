class MapsService
  class << self
    def get_image(address)
      response = conn.get("geocoding/v1/address?location=1625 fenton st lakewood co")
      parse_data(response)
    end

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
