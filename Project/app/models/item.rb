class Item < ActiveRecord::Base
	belongs_to :trading_party
	belongs_to :traveling_party
	
	def type_setter=(type_name)
		self[:type]=type_name
	end

	def get_total_weight
		(weight*quantity).to_s
	end
	
	def get_total_price
		(value*quantity).to_s
	end
end