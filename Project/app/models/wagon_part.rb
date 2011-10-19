class WagonPart < Item
	def initialize
		super(:name=>"WagonPart", :weight=>10, :value=>20, :quantity=>0)
	end
end

class Axle < WagonPart
	def initialize
		super(:name=>"Axle", :weight=>10, :value=>20, :quantity=>0)
	end
end

class Wheel < WagonPart
	def initialize
		super(:name=>"Wheel", :weight=>10, :value=>15, :quantity=>0)
	end
end

class Tongue < WagonPart
	def initialize
		super(:name=>"Tongue", :weight=>5, :value=>10, :quantity=>0)
	end
end