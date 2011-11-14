class TravelingPartiesController < ApplicationController

    def show
        @traveling_party = TravelingParty.find(params[:id])
        session[:party] = @traveling_party.id
        redirect_to '/play'
    end

    def new
        @traveling_party = TravelingParty.new
        @traveling_party.build_leader
        4.times do
            @traveling_party.followers.build
        end
    end

    def create
        @traveling_party = @user.traveling_parties.create(params[:traveling_party])
        if @traveling_party.save
            session[:party] = @traveling_party.id
            flash[:notice] = "Successfully created traveling party and travelers."
            redirect_to '/store/1'
        else
            puts @traveling_party.errors.inspect
            flash[:error] = "Please specify a leader."
            redirect_to '/new/'
        end
    end

    def update
        @traveling_party = TravelingParty.find(params[:id])
        f = params[:traveling_party]
		store_id = f.delete("store_id").to_i
        purchases = {}
        Item.new.types.each do |t|
            n = f.delete(t)
            if n.to_i > 0 then Item.where({:trader_id => store_id, :type => t}).limit(n).update_all(:trader_id => @traveling_party.id) end
            end

            if @traveling_party.update_attributes(f)
                flash[:notice] = "Successfully updated traveling party."
                redirect_to '/play/'
            else
                flash[:error] = "Transaction could not be completed."
                redirect_to '/store/'
            end
        end

        def index
        end

    end
