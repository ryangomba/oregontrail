class TradersController < ApplicationController

    def show
        @traveling_party = TravelingParty.find_by_id(session[:party])
        @store = Store.where(:position => @traveling_party.position).first()
        if @store.nil?
            @store = Store.create(:position => @traveling_party.position)
        end
    end

    def inventory
        @traveling_party = TravelingParty.find_by_id(session[:party])

        if params[:action] == "continue"
            redirect_to '/play/'
        else
            redirect_to '/store/'
        end 
    end

end
