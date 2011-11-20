class Traveler < ActiveRecord::Base
    scope :sick, where("illnesses IS NOT '00000'")
    scope :unsick, where("illnesses IS NOT '11111'")

    belongs_to :traveling_party

    validates_presence_of :name, :health, :illnesses
    
    def current_illnesses
        return self.get_illnesses('1')
    end
    
    def possible_illnesses
        return self.get_illnesses('0')
    end
    
    def get_illnesses(have)
        nums = self.illnesses.dup
        illness_arr = []
        (0..nums.length).each do |char|
            if nums[char,1] == have
                illness_arr << char
            end
        end
        return illness_arr
    end
    
    def make_sick(index)
        self.change_sickness(index, '1')
    end
    
    def has_clothing
        prob_clothing = self.traveling_party.items.clothing.count / (self.traveling_party.people * 1.0)
        return Random.rand < prob_clothing
    end
    
    def live
        health_d = 0
        # speed
        if self.traveling_party.speed == 0 then health_d += 5 end
        if self.traveling_party.speed > 20 then health_d -= 5 end
        # illnesses
        if self.traveling_party.speed > 0 then health_d -= current_illnesses.count * 5 end
        # rationing
        health_d -= (2 - self.traveling_party.ration) * 5
        # clothing
        if !has_clothing then health_d -= 5 end
        # done
        self.health += health_d
    end
    
    def recover(index)
        self.change_sickness(index, '0')
    end
    
    def change_sickness(index, have)
        if index
            nums = self.illnesses.dup
            nums[index,1] = have
            self.illnesses = nums
            self.save()
        end
    end
    
    before_save :check_health
    private
    def check_health
        if self.health > 100 then self.health = 100 end
    end
    
    after_save :check_death
    private
    def check_death
        if self.health <= 0 then self.destroy end
    end

end
