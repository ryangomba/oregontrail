class User < ActiveRecord::Base

    has_many :traveling_parties

    validates_presence_of :email, :f_id, :f_token
    
    def self.create_with_facebook(fb)
        user = find_by_f_id(fb["uid"])
        user ? user : create(
            f_id: fb["uid"],
            f_token: fb["credentials"]["token"],
            first_name: fb["info"]["first_name"],
            last_name: fb["info"]["last_name"],
            email: fb["info"]["email"],
            image: fb["info"]["image"]
        )
    end

end
