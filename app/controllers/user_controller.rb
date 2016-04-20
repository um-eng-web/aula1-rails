class UserController < ApplicationController
    
    def index
        @users = User.includes(:posts) 
    end
end
