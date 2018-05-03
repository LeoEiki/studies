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



class Product < SimpleStore
	
	@@Product = []
	@@uniqueid = []

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
		@code = "#{PRODUCT_TYPES.key[product_code]}--#{@manufacturer_code}--#{@barcode}"
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


class PhysicalProduct < Product  

	def initialize (hsh = { 'title' =>nil, 'price' =>0, 'manufacturer_code' =>0, 'barcode' =>nil, 'product_code' =>0})
		@@Product << self
		@title = hsh['title']
		@price = hsh['price']
		@manufacturer_code = hsh['manufacturer_code'].to_i
		@manufacturer = AUTHORIZED_MANUFACTURERS.key(manufacturer_code)
		@barcode = hsh['barcode']
		@code = "#{PRODUCT_TYPES.key[product_code]}--#{@manufacturer_code}--#{@barcode}"
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

		super

	end 

end





















































