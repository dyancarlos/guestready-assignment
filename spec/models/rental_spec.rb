require "rails_helper"

describe Rental, type: :model do
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:long_term_value) }
end
