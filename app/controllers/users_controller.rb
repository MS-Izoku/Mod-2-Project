class UsersController < ApplicationController
    before_action :find_user, only: [:edit, :update, :show, :destroy, :index] 

    def new
        @user = User.new 
    end 

    def index 
        @users = User.all
    end 
    
    def create 
        @user = User.new(user_params)
        if @user.valid?
           @user.save 
            redirect_to user_path(@user)
        else 
            render :new
        end
    end 

    def show 
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
         

    def destroy
        @user.destroy 
        flash[:notice] = "Account Deleted. Sorry to see you go"
        # need a path to a home page of some sort. 
    end 

    private
    
    def find_user
        @user = User.find_by(id: params[:id])
    end


    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :full_name, :city, :programming_language, :img_url)
    end 
end 

