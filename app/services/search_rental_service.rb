require 'ostruct'

class SearchRentalService
  AIRBNB_URI = "https://www.airbnb.com.br/wmpw_data".freeze

  def initialize(address)
    @address = address
  end

  def long_term
    search_long_term_for_address.data
  end

  private

  def search_long_term_for_address
    response = HTTParty.get(AIRBNB_URI, query: params, headers: headers)
    JSON.parse(response.body, object_class: OpenStruct)
  end

  def headers
    {
      'Content-Type' => 'application/json',
      'Accept'       => 'application/json'
    }
  end

  def params
    {
      'room_type'       => 'Entire home/apt',
      'duration'        => '1_year',
      'occupancy_rate'  => '100',
      'person_capacity' => '2',
      'address'         => @address
    }
  end
end
