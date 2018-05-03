module DiscountEligible
  
  def has_discount?
    @days_to_expire >= 0 && days_to_expire <= 30
    puts "Tem Desconto!"
  end

  def discount_percentage
    if has_discount?
      @discount_percentage = -(0.6/30) * days_to_expire + 0.6
    else
      0
    end
  end

  #
  # @return [Fixnum] The number of days until the product expiration date.
  #
  require 'date'

  def days_to_expire
    
    @days_to_expire = (Date.today.to_time.to_i/86400)  - (Date.new(@expiration_day).to_time.to_i/86400)
    @days_to_expire.to_i
  
  end

  #
  # @return [Float] The amount of discount, with at most 2 decimal places.
  #
  def discount_amount

    @discount_amount = @price - @discounted_price
    @discount_amount.to_f.round(2)
     
  end

  #
  # @return [Float] the price of the product considering the discount_amount.
  # The value must be rounded to at most 2 decimal places.
  #
  def discounted_price

     @discounted_price = (@price * @discount_percentage) / 100

  end
end
