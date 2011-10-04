module TravelingPartiesHelper

    def add_traveler_link(name)
        link_to_function name do |page|
            page.insert_html :bottom, :tasks, :partial => 'traveler', :object => Traveler.new
        end
    end

end
