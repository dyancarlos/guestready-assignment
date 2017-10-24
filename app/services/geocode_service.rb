class GeocodeService
  def initialize(address)
    @address = address
  end

  def geocode_formated
    geocode = geocode_response.results.first

    {
      lat: geocode.geometry.location.lat,
      lng: geocode.geometry.location.lng
    }
  end

  private

  def geocode_response
    response = HTTParty.get(geocode_uri)
    JSON.parse(response.body, object_class: OpenStruct)
  end

  def geocode_uri
    uri = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@address}&key=AIzaSyCWV2kkwCHooSMVJ4agaeRa3qdt2Xyzbrs"
    URI.parse(URI.encode(uri))
  end
end
