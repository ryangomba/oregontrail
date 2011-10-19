class Food < Item
	
	def initialize
		super(:name=>"Food", :weight=>5, :value=>5, :quantity=>0)
	end
end

class Ox < Item
	
	def initialize
		super(:name=>"Ox", :weight=>0, :value=>20, :quantity=>0)
	end
end

class Clothing < Item
	
	def initialize
		super(:name=>"Clothing", :weight=>5, :value=>5, :quantity=>0)
	end
end

class Ammunition < Item
	
	def initialize
		super(:name=>"Ammo", :weight=>2, :value=>2, :quantity=>0)
	end
end