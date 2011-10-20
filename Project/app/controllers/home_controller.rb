class HomeController < ApplicationController

    def index
    end
 
    def store

        @traveling_party = TravelingParty.order("updated_at").last()

    end

    def inventory

        @traveling_party = TravelingParty.order("updated_at").last()

        if params[:action] == "continue"
            redirect_to '/gameplay/'
        else
            redirect_to '/store/'
        end 

    end

    def gameplay
    end

end
