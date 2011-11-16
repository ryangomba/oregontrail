require 'Events'

class TravelingParty < Trader
    default_scope order("updated_at DESC")

    def name
        "#{self.leader.name} and company"
    end

    def money
        if self[:money].nil? then self[:money] = self.leader.money end
        return self[:money]
    end

    #def party_travelers
    #    t = []
    #    self.followers.each do |f|
    #        t << f
    #    end
    #    t << self.leader
    #end

    def people
        return self.followers.count + 1
    end
    
    def nearby_traders
        all_traders = Trader.where(:position => self.position)
	    traders = []
	    all_traders.each do |t|
	        if t.id != self.id then traders.push(t) end
        end
        return traders
    end
    
    has_many :travelers

    has_one :leader, :dependent => :destroy
    accepts_nested_attributes_for :leader,
        :allow_destroy => true

    has_many :followers, :dependent => :destroy
    accepts_nested_attributes_for :followers,
        :reject_if => :reject_follower,
        :allow_destroy => true

    validates_presence_of :speed, :ration, :capacity
    
    def roll
        Event.list.shuffle.each do |e|
            event = e.constantize.new
            if event.roll(self)
                return event.occur(self)
            end
        end
        return "Moved without incident."
    end
    
    def move
        if self.speed > 0
            self.pull
            return "Traveled #{self.speed} miles. #{self.roll}"
        else
            self.rest
            return "Rested."
        end
    end
    
    def rest
        self.eat
        self.items.oxen.each do |ox|
            ox.health += 10
            ox.save
        end
        self.travelers.each do |t|
            t.live
            t.save
        end
    end
    
    def pull
        self.eat
        if self.speed > 20 then m = 2 else m = 1 end
        self.items.oxen.used.each do |ox|
            ox.health -= self.pace / 10 * m
            ox.save
        end
        self.travelers.each do |t|
            t.live
            t.save
        end
    end
    
    def eat
        food_eaten = self.ration * self.people
		self.items.food.limit(food_eaten).destroy_all()
    end

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
