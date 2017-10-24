# coding: utf-8
require "rails_helper"

describe SearchRentalService do
  context "success to search" do
    before do
      stub_request(:get, "https://www.airbnb.com.br/wmpw_data?currency=USD&duration=1_month&lat=-23.5505199&lng=-46.63330939999999&occupancy_rate=100&person_capacity=2&room_type=Entire%20home/apt").
        with(headers: {'Accept'=>'application/json', 'Content-Type'=>'application/json'}).
        to_return(status: 200, body: File.new('spec/rental.json').read, headers: {})
    end

    let(:search) do
      SearchRentalService.new("São Paulo, SP, Brasil")
    end

    it "return long term for address" do
      expect(search.long_term).to eq "$733"
    end

    it "long term must be a string" do
      expect(search.long_term).to be_an_instance_of String
    end

    it "should be a valid airbnb uri" do
      expect(SearchRentalService::AIRBNB_URI).to eq "https://www.airbnb.com.br/wmpw_data"
    end
  end
end
