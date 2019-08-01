class UsersController < ApplicationController
    before_action :find_user, only: [:edit, :update, :show, :destroy, :user_posts] 

    def new
        @user = User.new 
        if logged_in? 
            redirect_to user_path(current_user)
        else 
            render :new 
        end 
    end 

    def create 
        @user = User.new(user_params)
        if @user.valid?
           @user.save 
           session[:user_id] = @user.id
           session[:user] = @user.username
            redirect_to user_path(@user)
        else 
            @errors = @user.errors.full_messages
            render :new
        end
    end 

    def show 
        @user_goals = UserGoal.all 
    end 

    def edit 
    end 

    def update
        @user.assign_attributes(user_params)

        if @user.save
            redirect_to @user
        else
            render :new
        end
    end

    def user_posts
        @progress_updates = @user.progress_updates
    end
         

    def destroy
        reset_session

        @user.destroy 
        flash[:notice] = "Account Deleted. Sorry to see you go"
        redirect_to feed_path 
        
    end 

    private
    
    def find_user
        @user = User.find_by(id: params[:id])
    end


    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :full_name, :city, :programming_language, :img_url)
    end 
end 

