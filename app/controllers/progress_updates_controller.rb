class ProgressUpdatesController < ApplicationController
 
    def index
        if current_user == nil
            redirect_to login_path
        end

        @progress_updates = ProgressUpdate.all
    end

    def show
        @progress_update = ProgressUpdate.find_by(id: params[:id])
        @comment = Comment.new
    end

    def post_comment
        @comment = Comment.new(comment_params)
        @comment.user_id = session[:user_id]
        @comment.progress_update_id = params[:id]
        if @comment.save
            redirect_to current_path
        else
            p "Invalid"
        end
    end

    def delete_comment
        @comment = Comment.find_by(comment_params)
        #@comment.delete
        redirect_to '/'
    end

    def new
        @progress_update = ProgressUpdate.new
        @current_goals = UserGoal.where(id: session[:user_id]).to_a
    end

    def create
        @progress_update = ProgressUpdate.new(update_params)
        if @progress_update.save
            # this has a monkey-patch in the model to account for nil/numerical-string values getting passed
            #@progress_update.user_goal.update(completion: @progress_update.goal_completion_status)
            completion = false
            if params[:goal_completion_status] == "1"
                completion = true
            end
            p params

            @progress_update.user_goal.update(completion: completion)
            redirect_to progress_update_path(@progress_update)
        else
            render 'new'
        end
    end

    def edit
        @progress_update = ProgressUpdate.find_by(id: params[:id])
    end

    def update
        @progress_update = ProgressUpdate.find_by(id: params[:id])
        if @progress_update.update(update_params)
            redirect_to progress_update_path(@progress_update)
        else
            render 'edit'
        end
    end


    private
    def update_params
        params.require(:progress_update).permit(:content , :user_goal_id , :user_goal , :goal_completion_status)
    end

    def comment_params
        params.require(:comment).permit(:user_id , :progress_update_id , :content)
    end


end
