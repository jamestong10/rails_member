module ProductsHelper

  def discount_price(price)
    discount = 0.8
    (price * discount).floor
  end
end