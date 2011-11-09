class River < ActiveRecord::Base
    
	validates_presence_of :position, :min_depth, :max_depth
	
	def options(money)
	    options = ["Ford", "Caulk"]
	    if self.ferry && money >= 25 then options << "Ferry ($25)" end
	    return options
    end
    
    def cross(traveling_party, method)
        if method == 'Ferry ($25)'
            traveling_party.money -= 25
            traveling_party.save
        elsif (method == 'Ford' && self.ford == false) || (method == 'Caulk' && self.caulk == false)
            if method == 'Caulk'
                traveling_party.raid
                return "Flipped! You lost some items!"
            else
                traveling_party.kill_member
                return "Flipped! Someone in your party died!"
            end
        end
        return "Successfully crossed the river"
    end
    
    def ford
        if (self.min_depth + self.max_depth)/2 > 4
            return caulk
        else
            return false
        end
    end
    
    def caulk
        rand(3) > 2
    end
	
end