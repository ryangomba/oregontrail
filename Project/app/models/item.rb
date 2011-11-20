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

    def self.value;  0; end
    def self.weight; 0; end

    belongs_to :trader

    validates_presence_of :type, :trader_id
    
    before_save :check_health
    private
    def check_health
        if self.health > 100 then self.health = 100 end
    end

end

class VariableItem < Item
    validates_presence_of :health
end

# REGULAR ITEMS

class Food < Item
    def self.value;  1; end
    def self.weight; 1; end
end

class Clothing < Item
    def self.value;  10; end
    def self.weight; 5; end
end

class Ammo < Item
    def self.value;  1; end
    def self.weight; 1; end
end

class Wheel < Item
    def self.value;  25; end
    def self.weight; 10; end
end

class Axle < Item
    def self.value;  50; end
    def self.weight; 15; end
end

class Tongue < Item
    def self.value;  100; end
    def self.weight; 20; end
end

# VARIABLE ITEMS

class Ox < VariableItem
    def self.value;  50; end
    def self.weight; 0; end
end
