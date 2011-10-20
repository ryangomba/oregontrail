require 'Items'

class Item < ActiveRecord::Base
	
    belongs_to :trading_party
	belongs_to :traveling_party
	
    def make
        if self[:name] == 'Food'
            return Food.new
        elsif self[:name] == 'Ox'
            return Ox.new
        elsif self[:name] == 'Clothing'
            return Clothing.new
        elsif self[:name] == 'Ammo'
            return Ammunition.new
        elsif self[:name] == 'Axle'
            return Axle.new
        elsif self[:name] == 'Wheel'
            return Wheel.new
        elsif self[:name] == 'Tongue'
            return Tongue.new
        end
    end

    def make_all
        items = []
        self[:quantity].times do
            items << self.make
        end
        return items
    end

    def total_weight
        return self.make.weight * self[:quantity]
    end

    def total_price
        return self.make.value * self[:quantity]
    end

end
