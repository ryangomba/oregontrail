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

class Ox < Item
	#TODO - health attribute
	
	def initialize
		super('Ox', 20, 0)
	end
end

class Food < Item
	def initialize
		super('Food', 5, 5)
	end
end

class Clothing < Item
	def initialize
		super('Clothing', 5, 5)
	end
end

class Ammunition < Item
	def initialize
		super('Ammo', 2, 2)
	end
end

class Money < Item
	def initialize
		#super('Food', value, 0)
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

class Wheel < WagonPart
	def initialize
		super('Wheel', 15, 10)
	end
end

class Tongue < WagonPart
	def initialize
		super('Tongue', 10, 5)
	end
end