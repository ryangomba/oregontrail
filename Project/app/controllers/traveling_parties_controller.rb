class TravelingPartiesController < ApplicationController

    def new
        @traveling_party = TravelingParty.new
        5.times do
		   traveler = @traveling_party.travelers.build
        end
    end

    def create
        @traveling_party = TravelingParty.new(params[:traveling_party])
        if @traveling_party.save
			@traveling_party.items << "Food".titleize.singularize.constantize.new
			@traveling_party.items << "Ox".titleize.singularize.constantize.new
			@traveling_party.items << "Clothing".titleize.singularize.constantize.new
			@traveling_party.items << "Ammunition".titleize.singularize.constantize.new
			#TODO - Creating WagonParts
			#@traveling_party.items << "WagonPart::Wheel".titleize.singularize.constantize.new
			
           # flash[:notice] = "Successfully created traveling party and travelers."
            redirect_to '/store/'
        else
            flash[:error] = "Please specify a leader."
            redirect_to '/new/'
        end
    end

    def index
    end

end
