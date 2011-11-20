class LocationsController < ApplicationController
    before_filter :check_party
    before_filter :update_traveling_party, only: [:move]

    def show
		@location = Location.where("position >= #{@traveling_party.position}").order("position ASC").first
	    @traders = @traveling_party.nearby_traders
        @river = River.find_by_position(@traveling_party.position)
	end
	
	def update_traveling_party
	    if params[:traveling_party]
            @traveling_party.speed = params[:traveling_party][:speed].to_i
		    @traveling_party.ration = params[:traveling_party][:ration].to_i
		    @traveling_party.save
		end
    end
	
	def move
	    @location = Location.where("position > #{@traveling_party.position}").order("position ASC").first
	    
		if !@traveling_party.ready
		    flash[:notice] = "You're not ready to move. Check your wagon."
		    redirect_to @location and return
		end
		
		@river = River.find_by_position(@traveling_party.position)
		if @river && @traveling_party.speed > 0
		    if params[:method]
		        flash[:river] = @river.cross(@traveling_party, params[:method])
		    else
		        render 'cross' and return
		    end
	    end
		
		@traveling_party.position += @traveling_party.speed
		if @traveling_party.position > @location.position
			@traveling_party.position = @location.position
		end
				
		if @traveling_party.save()
		    flash[:notice] = @traveling_party.move
		    flash[:event] = @traveling_party.roll
            if @traveling_party.position >= 2000 then
                redirect_to '/win/' and return
            else
                redirect_to @location and return
            end
        else
            flash[:error] = "Transaction could not be completed."
            redirect_to @location and return
        end
	end
	
	def map
		@locations = Location.all
		respond_to do |format|
              format.html
              format.js
        end
	end

end
