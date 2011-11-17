class ApplicationController < ActionController::Base
    protect_from_forgery
    
    before_filter :current_user
    def current_user
        @user = User.find_by_id(session[:user_id])
    end
    
    def check_party
        @traveling_party = TravelingParty.find_by_id(session[:party])
		unless @traveling_party then redirect_to '/die' and return false end
    end
end
