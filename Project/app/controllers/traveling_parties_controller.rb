

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

            @traveling_party.money = @traveling_party.leader.money
            @traveling_party.save
            
            flash[:notice] = "Successfully created traveling party and travelers."
            redirect_to '/store/'
        else
            flash[:error] = "Please specify a leader."
            redirect_to '/new/'
        end
    end

    def update
        @traveling_party = TravelingParty.find(params[:id])

        f = params[:traveling_party]

        if @traveling_party.update_attributes(f)
            flash[:notice] = "Successfully updated traveling party."
            redirect_to '/gameplay/'
        else
            flash[:error] = "Transaction could not be completed."
            redirect_to '/store/'
        end
    end

    def index
    end

end
