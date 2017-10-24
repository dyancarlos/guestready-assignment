class ProfitService
  def initialize(long_term, long_term_airbnb)
    @long_term        = long_term
    @long_term_airbnb = long_term_airbnb
  end

  def rental_difference
    (@long_term.to_f - @long_term_airbnb.gsub(/\W/, '').to_f).abs
  end

  def profitable?
    @long_term_airbnb > @long_term ? t("profit.yes") : t("profit.no")
  end
end
