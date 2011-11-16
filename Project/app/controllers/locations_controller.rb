class LocationsController < ApplicationController
    before_filter :check_party

    def show
		@location = Location.where("position >= #{@traveling_party.position}").order("position ASC").first
	    @traders = @traveling_party.nearby_traders
        @river = River.find_by_position(@traveling_party.position)
	end
	
	def next	    
	    @river = River.find_by_position(@traveling_party.position)
		if @river.nil? || @traveling_party.speed == 0
		    move()
	    else
	        cross()
        end
    end
	
	def cross
	    @f = params[:traveling_party]
	    @river = River.where(:position => @traveling_party.position).first
	    render 'cross'
    end
    
    def crossed
        
        #alter traveling party & then move
        
        @river = River.where(:position => @traveling_party.position).first

        method = params[:method]
        flash[:river] = @river.cross(@traveling_party, method)
        
        if @traveling_party.destroyed?
            redirect_to '/die'
        else
            @traveling_party.speed = params["speed"].to_i
    		@traveling_party.ration = params["ration"].to_i
    		@traveling_party.save
        
            move()
        end
        
    end
	
	def move
	    
	    f = params[:traveling_party]
	    if !f then f = params end

		@traveling_party.speed = f["speed"].to_i
		@traveling_party.ration = f["ration"].to_i
		
		@location = Location.where("position > #{@traveling_party.position}").order("position ASC").first
		
		@traveling_party.position += @traveling_party.speed
		if @traveling_party.position > @location.position
			@traveling_party.position = @location.position
		end
				
		if @traveling_party.save()
		    flash[:notice] = @traveling_party.move
            if @traveling_party.position >= 2000 then
                redirect_to '/win/'
            else
                redirect_to '/play'
            end
        else
            flash[:error] = "Transaction could not be completed."
            redirect_to '/play/'
        end
	end
	
	def map
		@locations = Location.all
		@test = "testing
		respond_to do |format|
              format.html
              format.js
        end"
	end

end
