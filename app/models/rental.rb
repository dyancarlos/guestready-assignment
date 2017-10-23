class Rental
  include ActiveModel::Model

  attr_accessor :address,
                :long_term_value

  validates :address,
            :long_term_value, presence: true
end
