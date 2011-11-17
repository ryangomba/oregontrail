class Event
	attr_reader :name, :prob
	
	def initialize(name, prob)
		@name = name
		@prob = prob
	end
	
	def roll(tp)
	    return Random.rand < self.prob
    end
	
	def self.list
	    ['Illness','Recovery','Death','Raid','Donation', 'Storm', 'Damage']
    end
	
	def occur(tp)
	    return 'Not implemented'
    end
	
	def to_s
		self.name
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
	def roll(tp)
	    if tp.travelers.unsick.empty?
	        return false
	    end
	    super(tp)
    end
	def occur(tp)
	    victim = tp.travelers.unsick.sample
	    illness = victim.possible_illnesses.sample
	    victim.make_sick(illness)
	    return "#{victim.name} is sick with #{ILLNESSES[illness]}."
    end
end

class Recovery < Event
    def initialize
		super('Recovery', 0.1)
	end
	def roll(tp)
	    if tp.travelers.sick.empty?
	        return false
	    end
	    super(tp)
    end
	def occur(tp)
	    benefactor = tp.travelers.sick.sample
	    illness = benefactor.current_illnesses.sample
	    benefactor.recover(illness)
	    return "#{benefactor.name} recovered from #{ILLNESSES[illness]}."
    end
end

class Death < Event
    def initialize
		super('Death', 0.01)
	end
	def occur(tp)
	    return "#{tp.kill_member} died."
    end
end

class Raid < Event
    def initialize
		super('Raid', 0.2)
	end
	def occur(tp)
	    tp.raid
	    return "You got raided and lost some supplies."
    end
end

class Donation < Event
    def initialize
		super('Donation', 0.1)
	end
	def occur(tp)
	    Random.new.rand(10..100).times do
	        Food.create(trader_id: tp.id)
        end
        return "A nearby party lent you some food."
    end
end

class Storm < Event
    def initialize
		super('Storm', 0.1)
	end
	def occur(tp)
	    days = Random.new.rand(1..10)
	    days.times do
	        tp.eat
        end
        return "A storm set you back #{days} days."
    end
end

class Damage < Event
    def initialize
		super('Wagon Damage', 0.1)
	end
	def occur(tp)
	    tp.break_down
        return "Your wagon has been damaged."
    end
end
