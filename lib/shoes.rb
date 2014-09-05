require 'pg'

class Shoes

	# attr_reader :brand, :shoes

	def initialize(brand, style_id)
		@brand = brand
		@style_id = style_id
		# @shoes = []
		# @brand = att[:brand].to_s
	end

	def brand
		@brand
	end

	def style_id
		@style_id
	end

	def save
		# shoes = []
		# database = PG.connect(:dbname => 'shoes_app')
		DB.exec("INSERT INTO shoes (brand, style_id) VALUES ('#{@brand}, #{@style_id}');")
		# shoes << Shoes.new(brand)
	end

	def self.all
		# database = PG.connect(:dbname => 'shoes_app')
		results = DB.exec("SELECT * FROM shoes;")
		shoes = []
		results.each do |result|
			brand = result['brand']
			style_id = result['style_id'].to_i
			shoes << Shoes.new(brand, style_id)
		end
		shoes
	end

	def ==(another_shoes)
		self.brand == another_shoes.brand && self.style_id == another_shoes.style_id
	end

end