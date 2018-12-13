module ProductsHelper

  def discount_price(price)
    Discount.getPrice('TEN_PERCENT_OFF', price).floor
  end
  
end