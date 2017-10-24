# coding: utf-8
# require "rails_helper"

# feature 'search long term renting' do
#   scenario 'with valid informations' do
#     visit '/'
#     find('#address').set 'São Paulo, SP, Brasil'
#     find('#long_term_value').set 500
#     click_button 'Search'
#     expect(page).to have_content "São Paulo, SP, Brasil"
#     expect(page).to have_content "$733"
#   end

#   scenario 'with invalid informations' do
#     visit '/'
#     find('#address').set ''
#     find('#long_term_value').set 500
#     click_button 'Search'
#     expect(page).to have_content "There were some errors"
#     expect(page).to have_content "Address can't be blank"
#   end
# end
