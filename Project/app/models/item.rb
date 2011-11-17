class Item < ActiveRecord::Base
    scope :food, where(type: 'Food')
    scope :clothing, where(type: 'Clothing')
    scope :ammo, where(type: 'Ammo')
    scope :wheels, where(type: 'Wheel')
    scope :axles, where(type: 'Axle')
    scope :tongues, where(type: 'Tongue')
    scope :oxen, where(type: 'Ox')
    
    scope :loose, where("type = 'Food' OR type = 'Clothing' OR type = 'Ammo'")
    scope :wagon, where("type = 'Wheel' OR type = 'Axle' OR type = 'Tongue'")
    
    scope :used, where(in_use: true)

    def types
        return ["Food", "Clothing", "Ammo", "Ox", "Wheel", "Axle", "Tongue"]
    end

    def value;  0; end
    def weight; 0; end

    belongs_to :trader

    validates_presence_of :type, :trader_id

end

class VariableItem < Item
    validates_presence_of :health
end

# REGULAR ITEMS

class Food < Item
    def value;  1; end
    def weight; 1; end
end

class Clothing < Item
    def value;  10; end
    def weight; 5; end
end

class Ammo < Item
    def value;  1; end
    def weight; 1; end
end

class Wheel < Item
    def value;  25; end
    def weight; 10; end
end

class Axle < Item
    def value;  50; end
    def weight; 15; end
end

class Tongue < Item
    def value;  100; end
    def weight; 20; end
end

# VARIABLE ITEMS

class Ox < VariableItem
    def value;  50; end
    def weight; 0; end
end
