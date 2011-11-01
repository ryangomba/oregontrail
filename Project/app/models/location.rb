class Location < ActiveRecord::Base
    
	validates_presence_of :position, :name
	
end