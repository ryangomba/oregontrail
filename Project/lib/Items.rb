class Item
	attr_reader :name, :value, :weight
	
	def initialize(name, value, weight)
		@name = name
		@value = value
		@weight = weight
	end
	
	def to_s
		name
	end
	
	def price(marketScale)
		value*marketScale
	end
end

class WagonPart < Item
	attr_accessor :working
	@working = true
end

class Axle < WagonPart
	def initialize
		super('Axle', 20, 10)
	end
end