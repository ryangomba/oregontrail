class Store < Trader
	
	after_create :fill
	
	def fill
	  items = {
	    "Food" => 10,
	    "Clothing" => 20,
	    "Ammo" => 30,
	    "Ox" => 40,
	    "Wheel" => 50,
	    "Axle" => 60,
	    "Tongue" => 70,
	  }
	  items.each_pair do |i,n|
	    n.times do
	      i.constantize.create(:health => 100, :trader_id => self.id)
      end
    end
  end
	
end
