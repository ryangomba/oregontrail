class TravelingParty < Trader

    def money
        if self[:money].nil? then self[:money] = self.leader.money end
        return self[:money]
    end
    
    def people
        return self.followers.count + 1
    end

    has_one :leader, :dependent => :destroy
    accepts_nested_attributes_for :leader,
        :allow_destroy => true

    has_many :followers, :dependent => :destroy
    accepts_nested_attributes_for :followers,
        :reject_if => :reject_follower,
        :allow_destroy => true

    validates_presence_of :speed, :ration, :capacity

    def reject_follower(attributes)
        attributes['name'].blank?
    end

    end
