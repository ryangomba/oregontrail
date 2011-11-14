class Event
	attr_reader :name, :prob
	
	def initialize(name, prob)
		@name = name
		@prob = prob
	end
	
	def self.list
	    ['Illness','Recovery','Death','Raid','Donation']
    end
	
	def self.occur(tp)
    end
	
	def self.to_s
		name
	end
end

ILLNESSES = [
    'Flu',
    'Food Poisoning',
    'Pneumonia',
    'Malaria',
    'Dysentary'
]

class Illness < Event
    def initialize
		super('Illness', 0.1)
	end
	def self.occur(tp)
	    victim = tp.travelers.sample
	    victim.make_sick(victim.possible_illnesses.sample)
    end
end

class Recovery < Event
    def initialize
		super('Recovery', 0.1)
	end
	def self.occur(tp)
	    benefactor = tp.travelers.sample
	    benefactor.recover(benefactor.current_illnesses.sample)
    end
end

class Death < Event
    def initialize
		super('Death', 0.05)
	end
	def self.occur(tp)
	    tp.kill_member
    end
end

class Raid < Event
    def initialize
		super('Raid', 0.2)
	end
	def self.occur(tp)
	    tp.raid
    end
end

class Donation < Event
    def initialize
		super('Donation', 0.1)
	end
	def self.occur(tp)
	    Random.new.rand(10..100).times do
	        Food.create(trader_id: tp.id)
        end
    end
end