class GoalsController < ApplicationController
    def index
        @goals = Goal.all
    end
    def show
        @goal = Goal.find(params[:id])
    end
    
    def new
        @goal = Goal.new
    end
    def create
        @goal = Goal.new(params[:goal])
        if @goal.save
          flash[:success] = "Goal successfully created"
          redirect_to @goal
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    def edit
        @goal = Goal.find(params[:id])
    end
    def update
        @goal = Goal.find(params[:id])
        if @goal.update_attributes(params[:goal])
          flash[:success] = "Goal was successfully updated"
          redirect_to @goal
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    def destroy
        @goal = Goal.find(params[:id])
        if @goal.destroy
            flash[:success] = 'Goal was successfully deleted.'
            redirect_to goals_url
        else
            flash[:error] = 'Something went wrong'
            redirect_to goals_url
        end
    end
    
    
end
