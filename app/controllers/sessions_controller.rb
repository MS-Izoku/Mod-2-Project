class SessionsController < ApplicationController
    #helpers included
    

    def new
        if session[:user_id]
            # byebug
            redirect_to user_path(current_user)
        end
    end

    def create
        username = params[:username]
        password = params[:password]
        user = User.find_by(username: username)
        if user && user.authenticate(password)
            session[:user_id] = user.id
            session[:user] = username
            redirect_to user_path(user)
        else
            flash[:errors] = ["Invalid Credentials"]
            render 'new'
        end
    end

    def destroy
        session.delete(:user_id)
        # session.destroy :user_id
        redirect_to login_path
    end
end