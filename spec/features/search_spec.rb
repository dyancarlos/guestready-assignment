# coding: utf-8
require "rails_helper"

feature 'search long term renting' do
  before do
    stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=S%C3%A3o%20Paulo,%20SP,%20Brasil&key=AIzaSyCWV2kkwCHooSMVJ4agaeRa3qdt2Xyzbrs").
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: File.new('spec/geocode.json').read, headers: {})

    stub_request(:get, "https://www.airbnb.com.br/wmpw_data?currency=USD&duration=1_month&lat=-23.5505199&lng=-46.63330939999999&occupancy_rate=100&person_capacity=2&room_type=Entire%20home/apt").
      with(headers: {'Accept'=>'application/json', 'Content-Type'=>'application/json'}).
      to_return(status: 200, body: File.new('spec/rental.json').read, headers: {})
  end

  scenario 'with valid informations' do
    visit '/'
    find('#address').set 'São Paulo, SP, Brasil'
    find('#long_term_value').set 500
    click_button 'Search'
    expect(page).to have_content "São Paulo, SP, Brasil"
    expect(page).to have_content "$733"
  end

  scenario 'with empty informations' do
    visit '/'
    find('#address').set ''
    find('#long_term_value').set 500
    click_button 'Search'
    expect(page).to have_content "There were some errors"
    expect(page).to have_content "Address can't be blank"
  end
end
