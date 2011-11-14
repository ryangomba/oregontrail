class TravelingParty < Trader
    default_scope order("updated_at DESC")

    def money
        if self[:money].nil? then self[:money] = self.leader.money end
        return self[:money]
    end

    def travelers
        t = []
        self.followers.each do |f|
            t << f
        end
        t << self.leader
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
    
    def kill_member
        if self.followers.count > 0
            member = self.followers.first.destroy
            return member.name
        else
            self.destroy
            return leader.name
        end
    end
    
    def raid
        self.items.limit(5).destroy_all
    end

end
