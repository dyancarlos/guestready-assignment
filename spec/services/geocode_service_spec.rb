# coding: utf-8
require "rails_helper"

describe GeocodeService do
  let(:url) do
    "https://maps.googleapis.com/maps/api/geocode/json?address=São Paulo, SP, Brasil&key=AIzaSyCWV2kkwCHooSMVJ4agaeRa3qdt2Xyzbrs"
  end

  let(:geocode) do
    GeocodeService.new("São Paulo, SP, Brasil")
  end

  context "success to get geocode" do
    before do
      stub_request(:get, url).
        with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(status: 200, body: File.new('spec/geocode.json').read, headers: {})
    end

    it "return geocode for address" do
      geocode_formated = { lat: -23.5505199, lng: -46.63330939999999 }
      expect(geocode.geocode_formated).to eq geocode_formated
    end

    it "geocode formated must be a hash" do
      expect(geocode.geocode_formated).to be_an_instance_of Hash
    end
  end
end
