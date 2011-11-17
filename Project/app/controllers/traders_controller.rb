class TradersController < ApplicationController
    before_filter :check_party

    def index
        @traders = @traveling_party.nearby_traders
    end

    def show
        @trader = Store.find(params[:id])
        if @trader.position != @traveling_party.position
            raise ActionController::RoutingError.new('Not Found')
        end
    end

    def inventory
        if params[:action] == "continue"
            redirect_to '/play/'
        else
            redirect_to '/store/'
        end 
    end

end
