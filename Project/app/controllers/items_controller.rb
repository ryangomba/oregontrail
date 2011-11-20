class ItemsController < ApplicationController
    before_filter :check_party

    def index
        @items = @traveling_party.inventory
    end
    
    def update
        @item = Item.find(params[:id])
        @item.in_use = params[:ox][:in_use]
        @item.save
        respond_to do |format|
            format.js
        end
    end
    
    def hunt
    end
    
    def shoot
        @kill = @traveling_party.shoot
        respond_to do |format|
            format.js
        end
    end

end
