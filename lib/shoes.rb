require 'pg'

class Shoes

	attr_reader :brand

	def initialize(brand)
		@brand = brand
	end

	def brand
		@brand
	end

	def save
		database = PG.connect(:dbname => 'shoes_app')
		database.exec("INSERT INTO shoes (brand) VALUES ('#{@brand}');")
	end

	def self.all
		database = PG.connect(:dbname => 'shoes_app')
		results = database.exec("SELECT * FROM shoes;")
		shoes = []
		results.each do |result|
			:brand = result[shoes.brand]
			shoes << Shoes.new(brand)
		end
		shoes
	end
end