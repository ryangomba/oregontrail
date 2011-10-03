class HomeController < ApplicationController

    def index
    end
    
    def new_game
        @leader = Traveler.new
        @travelers = Array.new(4) { |t| t = Traveler.new }
        @traveling_party = TravelingParty.new
        respond_to do |format|
            format.html # new_party.html.erb
        end
    end

end
