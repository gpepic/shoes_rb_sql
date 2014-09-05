

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

end
