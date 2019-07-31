class UserGoalsController < ApplicationController
    before_action :find_user_goal, only: [:edit, :update, :show, :destory]
    
    def new
        redirect_to login_path and return if !logged_in?
        @usergoal = UserGoal.new
    end

    def create
        @usergoal = UserGoal.new(usergoal_params)
        @usergoal.user_id = current_user.id
        if @usergoal.save
            flash[:success] = "UserGoal successfully created"
            redirect_to @usergoal
        else
            flash[:errors] = @usergoal.errors.full_messages
            render 'new'
        end
    end
    
    def show
    end
    
    def edit
        redirect_to login_path and return if !logged_in?
    end 

    def update
        if @usergoal.update_attributes(usergoal_params)
          flash[:success] = "UserGoal was successfully updated"
          redirect_to @usergoal
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    
    private

    def find_user_goal
        @usergoal = UserGoal.find(params[:id])
    end

    def usergoal_params
        params.require(:user_goal).permit(:user_id, :goal_id, :completion,:frequency, :notes)
    end
end
