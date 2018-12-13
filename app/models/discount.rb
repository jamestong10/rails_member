class Discount
  TEN_PERCENT_OFF = 0.9
  TWENTY_PERCENT_OFF = 0.8

  def self.getPrice(discount, price)
    case discount
    when 'TEN_PERCENT_OFF'
      TEN_PERCENT_OFF * price
    when 'TWENTY_PERCENT_OFF'
      TWENTY_PERCENT_OFF * price
    else
      price
    end
  end
end