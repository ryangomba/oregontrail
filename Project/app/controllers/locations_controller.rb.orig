class LocationsController < ApplicationController
    before_filter :check_party

    def show
		@location = Location.where("position >= #{@traveling_party.position}").order("position ASC").first
	    all_traders = Trader.where(:position => @traveling_party.position)
	    @traders = []
	    all_traders.each do |t|
	        if t.id != @traveling_party.id then @traders.push(t) end
        end
	end
	
	def next
	    
	    f = params[:traveling_party]
	    
	    @river = River.where(:position => @traveling_party.position)
		if @river.empty? || @traveling_party.speed == 0
		    move()
	    else
	        cross()
        end
	    
    end
	
	def cross
	    
	    @f = params[:traveling_party]
	    @river = River.where(:position => @traveling_party.position).first
	    
	    render "cross"
	    
    end
    
    def crossed
        
        #alter traveling party & then move
        
        @river = River.where(:position => @traveling_party.position).first

        method = params[:method]
        flash[:notice] = @river.cross(@traveling_party, method)
        
<<<<<<< HEAD
        check_party()
        
        @traveling_party.speed = params["speed"].to_i
		@traveling_party.ration = params["ration"].to_i
        
        if @traveling_party.save()
			#flash[:notice] = "Successfully updated traveling party."
        else
            flash[:error] = "Transaction could not be completed."
        end
        
        move()
=======
        #Check if traveling_party is still alive
        @traveling_party = TravelingParty.find_by_id(session[:party])
		if !@traveling_party
			redirect_to '/die'
		else
	        @traveling_party = TravelingParty.find_by_id(session[:party])
	        @traveling_party.speed = params["speed"].to_i
			@traveling_party.ration = params["ration"].to_i
	        
	        if @traveling_party.save()
				flash[:notice] = "Successfully crossed the river."
	        else
	            flash[:error] = "Action could not be taken."
	        end
	        
	        move()
    	end
>>>>>>> 3f42dc75a225baf7a1c22b6b54227ed4fe3875c2
        
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
		
		food_eaten = @traveling_party.ration * @traveling_party.people
		Item.where({:trader_id => @traveling_party.id, :type => "Food"}).limit(food_eaten).destroy_all()
		
		if @traveling_party.save()
			if @traveling_party.inventory["Food"] == 0
				flash[:notice] = "Traveled #{@traveling_party.speed} miles but don't have food to eat."
			else
				flash[:notice] = "Traveled #{@traveling_party.speed} miles and consumed #{food_eaten} meals."
			end

            if @traveling_party.position >= 2000
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
