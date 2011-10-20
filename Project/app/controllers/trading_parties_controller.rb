class TradingPartiesController < ApplicationController

	def new

		@trading_party = TradingParty.new
		@arr = [Food.new, Ox.new, Clothing.new, Ammunition.new]
		@traveling_party = TravelingParty.order("updated_at").last()
	
    end

	def create
	
		#TODO - Getting the quantity from the form and updating items and traveling_party capacity accordingly
		@traveling_party = TravelingParty.order("updated_at").last()
		#@arr = [Item.new(params[:item]).save]
		
		@item = Item.where(:traveling_party_id=>@traveling_party.id).last
		#@item.quantity = Item.where(:id=>@arr[0].id).quantity
		
		@traveling_party.capacity +=  @item.quantity
		@traveling_party.save
		
		#TODO - Redirecting based on which button is clicked
		if params[:action] == "continue"
			redirect_to '/gameplay/'
		else
            redirect_to '/store/'
		end
	
    end
	
	def continue
         redirect_to '/gameplay/'
	end
end
