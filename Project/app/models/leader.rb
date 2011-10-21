class Leader < Traveler
  
   PROFESSIONS = {
     "Farmer" => 400,
     "Banker" => 1600,
     "Carpenter" => 800,
     }
    
    validates_presence_of :profession
    validates_inclusion_of :profession, :in => PROFESSIONS.keys

    def money
        return PROFESSIONS[self[:profession]]
    end

end
