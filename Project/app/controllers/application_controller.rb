class ApplicationController < ActionController::Base
    protect_from_forgery
    
    before_filter :check_health, :except => [:index, :die]
    def check_health
        @traveling_party = TravelingParty.find_by_id(session[:party])
		if !@traveling_party then redirect_to '/die' end
    end
end
