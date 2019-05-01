class Stock < ApplicationRecord
  def self.new_from_lookup(ticker_symbol)
    stock = StockQuote::Stock.quote(ticker_symbol)
    if !stock.nil?
      new(name: stock.company_name,ticker: stock.symbol, last_price: stock.latest_price)
    else
      nil
    end
  end
end
