class M5E2 

  attr_accessor :cpfs
  attr_reader :cpf_match
  attr_accessor :emails
  attr_reader :email_match
  attr_accessor :prices
  attr_reader  :price_match

  def initialize 
  
    @cpfs = Array.new
    @emails = Array.new 
    @prices = Array.new

  end

  def cpf_validation(cpf)

    @cpfs << cpf
    @cpf_match = cpf.match(/\d{3}\.?\d{3}\.?\d{3}-?\d{2}/)  
    
    if @cpf_match != nil  
      return true 
    else 
      return false
    end  
  end
  
  def email_validation(email)
    @emails << email
    @email_match = email.match(/[\w\.@][\w\.]++/)

    if @email_match != nil 
      return true
    else 
      return false
    end
  end

  def price_validation(price)
    @prices << price
    @price_match = price.match(/([A-Z])\$\s?[\d{3}\,]+\.\d{2}|([A-Z])\$\s?[\d{1,3}\.]/)

      if @price_match != nil and @price_match[1] == "R"
        puts "O preço está em real"
        return true 

      elsif @price_match != nil and @price_match[1] == "U"
        puts "O preço está em dolár"
        return true
      
      else
        return false 

      end 

    end
end


