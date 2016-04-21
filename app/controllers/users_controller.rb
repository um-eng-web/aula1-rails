class UsersController < ApplicationController

    def index
        @users = User.includes(:posts) 
    end


    def new
        @user = User.new
    end
end
