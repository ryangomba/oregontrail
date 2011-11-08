class ApplicationController < ActionController::Base
    protect_from_forgery
    
    def check_party
        @traveling_party = TravelingParty.find_by_id(session[:party])
		if !@traveling_party then redirect_to '/die' end
    end
end
