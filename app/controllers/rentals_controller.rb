class RentalsController < ApplicationController
  def index
  end

  def search
    @rental = Rental.new(rental_params)

    if @rental.valid?
      #todo
    else
      render :index
    end
  end

  private
  def rental_params
    params.permit(:address, :long_term_value)
  end
end
