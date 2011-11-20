class HomeController < ApplicationController

    def index
    end
    
    def auth
        respond_to do |format|
            format.js
        end
    end
    
    def logout
        @user = nil
        session[:user_id] = nil
        render 'auth'
    end
    
    def win
    end
    
    def die
    end

end
