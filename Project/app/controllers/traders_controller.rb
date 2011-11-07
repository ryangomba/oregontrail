class TradersController < ApplicationController

    def show
        @traveling_party = TravelingParty.find_by_id(session[:party])
        @trader = Store.find(params[:id])
        if @trader.position != @traveling_party.position
            raise ActionController::RoutingError.new('Not Found')
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
