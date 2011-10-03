class Traveler < ActiveRecord::Base
    belongs_to :traveling_party

    validates_presence_of :name, :health
end
