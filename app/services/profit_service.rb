class ProfitService
  def initialize(long_term, long_term_airbnb)
    @long_term        = long_term
    @long_term_airbnb = long_term_airbnb
  end

  def rental_difference
    (@long_term.to_f - long_term_airbnb).abs
  end

  def profitable?
    @long_term.to_f > long_term_airbnb ? I18n.t("search.profit_yes") : I18n.t("search.profit_no")
  end

  private

  def long_term_airbnb
    @long_term_airbnb.gsub(/\W/, '').to_f
  end
end
