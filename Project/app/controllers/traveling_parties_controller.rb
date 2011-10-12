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
            flash[:notice] = "Successfully created traveling party and travelers."
            redirect_to '/store/'
        else
            flash[:error] = "Please specify a leader."
            redirect_to '/new/'
        end
    end

    def index
    end

end
