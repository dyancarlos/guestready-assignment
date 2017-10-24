class RentalsController < ApplicationController
  def index
  end

  def search
    @rental = Rental.new(rental_params)

    if @rental.valid?
      long_term_renting
    else
      render :index
    end
  end

  private

  def long_term_renting
    begin
      @search_rental   ||= SearchRentalService.new(params[:address])
      @address           = params[:address]
      @long_term_default = params[:long_term_value]
      @long_term_airbnb  = @search_rental.long_term
    rescue
      redirect_to :root, flash: { error: t("rental.form.error") }
    end
  end

  def rental_params
    params.permit(:address, :long_term_value)
  end
end
