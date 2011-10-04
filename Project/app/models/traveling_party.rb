class TravelingParty < ActiveRecord::Base

    has_many :travelers, :dependent => :destroy
    validates_presence_of :speed, :ration, :position
    accepts_nested_attributes_for :travelers, :reject_if => :reject_traveler, :allow_destroy => true

    def reject_traveler(attributes)
       attributes['profession'].blank? and attributes['name'].blank?
    end

end
