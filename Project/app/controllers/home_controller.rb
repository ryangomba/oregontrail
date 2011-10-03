class HomeController < ApplicationController
    def index
    end
    
    def new
        respond_to |format|
        format.html
    end
end
