class UsersController < ApplicationController

    def create
        fb_params = request.env["omniauth.auth"]
        user = User.create_with_facebook(fb_params)
        session[:user_id] = user.id
        redirect_to root_url, notice: "You're signed in!"
    end

end
