class SessionsController < ApplicationController
    def new
        session[:user] ||= nil
        if session[:user] != nil
            redirect_to user_path(User.where(username: session[:user]))
        end
    end

    def create
        username = params[:username]
        password = params[:password]
        user = User.find_by(username: username)
        if user && user.authenticate(password)
            session[:user] = username
            redirect_to user_path(user)
        else
            render 'new'
        end
    end

    def destroy
        session.delete :user
        redirect_to new_user_path
    end
end