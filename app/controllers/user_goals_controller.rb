class UserGoalsController < ApplicationController
    before_action :find_user_goal, only: [:edit, :update, :show, :destroy]
    before_action :verify_login, only: [:new, :edit, :destroy]
    
    def new
        @usergoal = UserGoal.new
        @goals = Goal.all.sort_by { |g| g.post_count }.reverse
    end

    def create
        @usergoal = UserGoal.new_for_user(current_user, usergoal_params)

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

    def destroy
        @usergoal.destroy
        redirect_to user_path(current_user)
    end

    private

    def verify_login
        redirect_to login_path and return if !logged_in?
    end

    def find_user_goal
        @usergoal = UserGoal.find_by(id: params[:id])
    end

    def usergoal_params
        params.require(:user_goal).permit(:user_id, :goal_id, :completion,:frequency, :notes)
    end
end
