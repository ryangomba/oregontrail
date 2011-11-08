class Trader < ActiveRecord::Base

    has_many :items, :dependent => :destroy
    accepts_nested_attributes_for :items, :allow_destroy => true

    validates_presence_of :type, :position

    def inventory
        return self.items.group_by(&:type)
    end

    def market_value
        return 1 + (position/300.0).to_i
    end
    
    def raid
        self.items.limit(5).destroy_all
    end

end
