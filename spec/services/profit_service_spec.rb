# coding: utf-8
require "rails_helper"

describe ProfitService do
  let(:profit) { ProfitService.new(1000, "$700") }
  let(:not_profit) { ProfitService.new(500, "$900") }

  context "profitable" do
    it "return the rental difference" do
      expect(profit.rental_difference).to eq 300
    end

    it "sould be profitable" do
      expect(profit.profitable?).to eq "Yes"
    end
  end

  context "not profitable" do
    it "sould be profitable" do
      expect(not_profit.profitable?).to eq "No"
    end
  end
end
