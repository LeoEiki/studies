class SimpleStore

  PRODUCT_TYPES = {
    :Product => 0,
    :DigitalProduct => 1,
    :FreshProduct => 2,
    :PhysicalProduct => 3
  }

  AUTHORIZED_MANUFACTURERS = {
    # Digital products
    :OReillyMedia => 0,
    :Microsoft => 1,

    # Physical products
    :Sony => 2,
    :Apple => 3,
    :Unilever => 4,

    # Fresh products
    :ProdutosMaeTerra => 5,
    :PlanetaOrganico => 6,
    :SaborNatural => 7
  }

  class Error < RuntimeError; end

end

module DiscountEligible
  
  attr_reader :discount_percentage
  def has_discount?
    @days_to_expire >= 0 && @days_to_expire < 31
  end

  def discount_percentage
    if has_discount?
      @discount_percentage = -(0.6/30) * @days_to_expire + 0.6
    else
      0
    end
  end

  #
  # @return [Fixnum] The number of days until the product expiration date.
  #
  require 'date'

  def days_to_expire
    
    @days_to_expire = (@expiration_date.to_time.to_i/86400).to_i - (Date.today.to_time.to_i/86400)
    
  
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



class Product < SimpleStore
	
	@@Product ||= []
	@@uniqueid ||= []

	attr_reader :title 
	attr_reader :price
	attr_reader :manufacturer
	attr_reader :manufacturer_code
	attr_reader :barcode
	attr_reader :hash
	attr_reader :code 
	attr_writer :price
	attr_writer :manufacturer_code
	attr_writer :code


	def initialize (hsh = { 'title' =>nil, 'price' =>0, 'manufacturer_code' =>0, 'barcode' =>nil, 'product_code' =>0})
		@@Product << self
		@title = hsh['title']
		@price = hsh['price']
		@manufacturer_code = hsh['manufacturer_code'].to_i
		@manufacturer = AUTHORIZED_MANUFACTURERS.key(manufacturer_code)
		@barcode = hsh['barcode']
		@product_code = hsh['product_code']
		@code = "#{@product_code}--#{@manufacturer_code}--#{@barcode}"
		@@uniqueid << @code

		if @title == nil 
			    	fail SimpleStore::Error, "O título do produto não pode ser vazio"	 
		else
					puts "Título Válido"
		end
		if @price < 0
				    fail SimpleStore::Error, "O preço do produto deve ser >= 0.0"
		else 
					puts "Preço Válido"		
		end
		if @manufacturer != AUTHORIZED_MANUFACTURERS.key(manufacturer_code)
					fail SimpleStore::Error, "O fabricante não está autorizado"
		else 
					puts "Fabricante Válido"
		end

	end 
	

	def title=(title)
	
		@title = title.to_s

	end

	def barcode=(barcode)

		@barcode = barcode.to_s

	end

	def manufacturer=(manufacturer)

		if AUTHORIZED_MANUFACTURERS[].include? manufacturer == true 
			@manufacturer = manufacturer
		else 
			puts "Fabricante inválido"
		end
	end


	#def validation_title 
	#		if @title == nil 
	#			  fail SimpleStore::Error, "O título do produto não pode ser vazio"	 
	#		else 
	#				puts "Válido"
	#		end
			
	#end

	#def validation_price
	#		if @price < 0 
	#			  fail SimpleStore::Error, "O preço do produto deve ser >= 0.0"
	#		else 
	#				puts "Válido"	
	#		end
			
	#end

	#def validation_manufacturer
			
	#		if @manufacturer != AUTHORIZED_MANUFACTURERS.key(manufacturer_code)
	#				fail SimpleStore::Error, "O fabricante não está autorizado"
	#		else 
	#				puts "Válido"
	#		end
			
	#end

	private

	def generate_control_code(code)
			
			if  @@code[].include? code == true 
				fail SimpleStore::Error, "Este código já existe"
			else
				@@code << code
			end 
	end 



end

require 'date'

class DigitalProduct < Product

	include DiscountEligible

	attr_accessor :expiration_date


	 def initialize (hsh = { 'title' =>nil, 'price' =>0, 'manufacturer_code' =>0, 'barcode' =>nil, 'product_code' =>0, 'expiration_date' => nil, 'url'=>nil})
		@@Product << self
		@product_code = hsh['product_code']
		@expiration_date = Date.parse(hsh['expiration_date'])
		# Date.parse(@expiration_date)
		@url = hsh['url']

		if @expiration_date < Time.now.to_date 
			
			fail SimpleStore::Error, 'O produto não pode estar vencido'
			
		else
		
			puts "Data Válida"
		
		end		
		
		if @url.include? "http" 

			puts "A URL é Válida"

		else	

			fail SimpleStore::Error, 'A URL do produto deve ser válida'

			
		end

		super
	end
end



# product1 = DigitalProduct.new({'title'=>"teste",'price'=>10,'manufacture_code'=>0,'barcode'=>"aaa111",'product_code'=>1, 'expiration_date'=>"2018-04-17", 'url'=>"https://infosimples.com.br"})


class A
	def initialize(x)
		@x = x
	end

	def x
		@x
	end

	def x=(value)
		@x = x
	end
end

a = A.new(10)
@x # você espera reveber 10

a.instance_variable_get '@x'
a.x













































