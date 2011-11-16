class TravelersController < ApplicationController
    before_filter :check_party

    def index
        @travelers = @traveling_party.travelers
    end

end
