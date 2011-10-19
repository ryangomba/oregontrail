class TravelingParty < ActiveRecord::Base

    has_many :travelers, :dependent => :destroy
	has_many :items, :dependent => :destroy
    validates_presence_of :speed, :ration, :position
    accepts_nested_attributes_for :travelers, :reject_if => :reject_traveler, :allow_destroy => true
	accepts_nested_attributes_for :items, :allow_destroy => true

    after_create :make_inventory

    def make_inventory
        ['Food', 'Ox', 'Clothing', 'Ammo'].each do |i|
            Item.create(:name => i, :quantity => 0, :traveling_party_id => self.id)
        end
    end

    def reject_traveler(attributes)
       attributes['profession'].blank? and attributes['name'].blank?
    end

    def leader
        return self.travelers.where("profession IS NOT NULL").first()
    end
	
	def calculate_money
		
	end
	
	def calculate_capacity
		
	end
	
end
