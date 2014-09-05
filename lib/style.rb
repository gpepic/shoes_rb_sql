

class Style
	def initialize(name)
		@name = name
	end

	def name
		@name
	end

	def ==(another_style)
		self.name == another_style.name
	end

	def self.all
		results = DB.exec("SELECT * FROM style;")
		style = []
		results.each do |result|
			name = result['name']
			style << Style.new(name)
		end
		style	
	end

	def save
		DB.exec("INSERT INTO style (name) VALUES ('#{@name}');")
	end

end
