class TravelingParty < ActiveRecord::Base

    has_many :travelers, :dependent => :destroy
	has_many :items, :dependent => :destroy
    validates_presence_of :speed, :ration, :position
    accepts_nested_attributes_for :travelers, :reject_if => :reject_traveler, :allow_destroy => true
	accepts_nested_attributes_for :items, :allow_destroy => true

    def reject_traveler(attributes)
       attributes['profession'].blank? and attributes['name'].blank?
    end
	
	def calculate_money
		
	end
	
	def calculate_capacity
		
	end
	
	def get_money
		'$ '+money.to_s
	end
	
	def get_capacity
		capacity.to_s+' lbs'
	end

end
