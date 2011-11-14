class Traveler < ActiveRecord::Base

    belongs_to :traveling_party

    validates_presence_of :name, :health
    
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

end
