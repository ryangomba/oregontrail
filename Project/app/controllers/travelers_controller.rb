class TravelersController < ApplicationController

    # POST /travelers
    def create
        @traveler = Traveler.new(params[:traveler])
        respond_to do |format|
            if @traveler.save
                format.html { redirect_to @traveler, :notice => 'Traveler was successfully created.' }
            else
                format.html { render :action => "new" }
            end
        end
    end
   
end
