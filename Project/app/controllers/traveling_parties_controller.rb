class TravelingPartiesController < ApplicationController

    # POST /traveling_parties
    def create
        @traveling_party = TravelingParty.new(params[:traveling_party])
        respond_to do |format|
            if @traveling_party.save
                format.html { redirect_to @traveling_party, :notice => 'Athlete was successfully created.' }
            else
                format.html { render :action => "new" }
            end
        end
    end

end
