require 'Events'

class TravelingParty < Trader
    default_scope order("updated_at DESC")
    
    ##### RELATIONS #####

    has_many :travelers

    has_one :leader, :dependent => :destroy
    accepts_nested_attributes_for :leader,
        :allow_destroy => true

    has_many :followers, :dependent => :destroy
    accepts_nested_attributes_for :followers,
        :reject_if => :reject_follower,
        :allow_destroy => true

    validates_presence_of :speed, :ration, :capacity
    
    ##### RELATION HELPERS #####
    
    def reject_follower(attributes)
        attributes['name'].blank?
    end

    after_create :fill
    def fill
        Item.new
        items = {
            "Ox" => 2,
            "Wheel" => 4,
            "Axle" => 2,
            "Tongue" => 1,
        }
        items.each_pair do |i,n|
            n.times do
                i.constantize.create(:trader_id => self.id)
            end
        end
    end

    ##### ATTRIBUTE HELPERS #####

    def name
        "#{self.leader.name} and company"
    end

    def money
        if self[:money].nil? then self[:money] = self.leader.money end
        return self[:money]
    end

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
    
    ##### MOVEMENT #####
    
    def ready
        return (self.items.oxen.used.count >= 2 &&
            self.items.wheels.count >= 4 &&
            self.items.axles.count >= 2 &&
            self.items.tongues.count >= 1)
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
            ox.health -= self.speed / 10 * m
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

    ##### OTHER #####
    
    def roll
        Event.list.shuffle.each do |e|
            event = e.constantize.new
            if event.roll(self)
                return event.occur(self)
            end
        end
        return "Moved without incident."
    end
    
    def kill_member
        if self.followers.count > 0
            member = self.followers.first.destroy
            return member.name
        else
            leader = self.leader.destroy
            return leader.name
        end
    end
    
    def raid
        self.items.loose.limit(5).destroy_all
    end
    
    def break_down
        self.items.wagon.first.destroy
    end
    
    ##### CHECKS #####
    
    before_save :check_rations
    private
    def check_rations
        if self.ration * self.people > self.items.food.count
            self.ration = (self.items.food.count / self.people).to_i
        end
    end

end
