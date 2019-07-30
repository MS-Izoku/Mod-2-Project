class SessionsController < ApplicationController
    def new
        session[:user] ||= nil
    end

    def create
        username = params[:username]
        password = params[:password]
        user = User.find_by(username: username)
        if user && user.authenticate(password)
            session[:user] = username
            redirect_to '/'
        else
            render 'new'
        end
    end

    def destroy
        session.delete :user
        redirect_to '/'
    end
end