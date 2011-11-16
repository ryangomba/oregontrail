class ItemsController < ApplicationController
    before_filter :check_party

    def index
        @oxen = @traveling_party.items.oxen
    end

end
