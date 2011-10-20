class Traveler < ActiveRecord::Base

    belongs_to :traveling_party
    validates_presence_of :name, :health

    def money
        if self[:profession] == 'Farmer'
            return 400
        elsif self[:profession] == 'Banker'
            return 1600
        elsif self[:profession] == 'Carpenter'
            return 800
        end
        return 0
    end

end
