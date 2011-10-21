class TravelingPartiesController < ApplicationController

  def new
    @traveling_party = TravelingParty.new
    @traveling_party.build_leader
    4.times do
      @traveling_party.followers.build
    end
  end

  def create
    @traveling_party = TravelingParty.new(params[:traveling_party])
    if @traveling_party.save
      session[:party] = @traveling_party.id
      flash[:notice] = "Successfully created traveling party and travelers."
      redirect_to '/store/'
    else
      puts @traveling_party.errors.inspect
      flash[:error] = "Please specify a leader."
      redirect_to '/new/'
    end
  end

  def update
    @traveling_party = TravelingParty.find(params[:id])
    
    f = params[:traveling_party]
    purchases = {}
    Item.new.types.each do |t|
      n = f.delete(t)
      if n.to_i > 0 then Item.where(:type => t).limit(n).update_all(:trader_id => @traveling_party.id) end
    end

    if @traveling_party.update_attributes(f)
      flash[:notice] = "Successfully updated traveling party."
      redirect_to '/gameplay/'
    else
      flash[:error] = "Transaction could not be completed."
      redirect_to '/store/'
    end
  end

  def index
  end

end
