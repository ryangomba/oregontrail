class TravelingParty < ActiveRecord::Base
    has_many :travelers

    validates_presence_of :speed, :ration, :position
end
