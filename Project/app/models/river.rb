class River < ActiveRecord::Base
    
	validates_presence_of :position, :min_depth, :max_depth, :ferry
	
	def options(money)
	    options = ["Ford", "Caulk"]
	    if self.ferry && money >= 25 then options << "Ferry ($25)" end
	    return options
    end
	
end