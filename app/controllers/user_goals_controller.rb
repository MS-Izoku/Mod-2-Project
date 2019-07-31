class UserGoalsController < ApplicationController
    before_action :find_user_goal, only: [:edit, :update, :show, :destory]
    
    def new
        @usergoal = UserGoal.new
    end

    def create
        @usergoal = UserGoal.new(params[:usergoal])
        if @usergoal.save
          flash[:success] = "UserGoal successfully created"
          redirect_to @usergoal
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    
    def show
    end
    
    def edit
    end 

    def update
        if @usergoal.update_attributes(params[:usergoal])
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
        params.require(:usergoal).permit(:user_id, :goal_id, :frequency, :completion, :notes) 
    end
end
