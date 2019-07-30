class UserGoalsController < ApplicationController
    def new
        @usergoal = UserGoal.new
    end

    def show
        @usergoal = UserGoal.find(params[:id])
    end
    
    def edit
        @usergoal = UserGoal.find(params[:id])
    end 



    private

    def usergoal_params
        params.require(:usergoal).permit(:user_id, :goal_id, :frequency, :completion, :notes) 
    end
end
