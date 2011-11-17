class Store < Trader

    after_create :fill

    def fill
        Item.new
        items = {
            "Food" => 1000,
            "Clothing" => 100,
            "Ammo" => 100,
            "Ox" => 100,
            "Wheel" => 50,
            "Axle" => 50,
            "Tongue" => 20,
        }
        items.each_pair do |i,n|
            n.times do
                i.constantize.create(:trader_id => self.id)
            end
        end
    end
    
    def name
       Location.find_by_position(self.position).name
    end

end
