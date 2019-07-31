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

    def new
        @progress_update = ProgressUpdate.new
    end

    def create
        @progress_update = ProgressUpdate.new(update_params)
        # we may need to add some functionality to asscociate this correctly
        if @progress_update.save
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
        params.require(:progress_update).permit(:content , :user_goal_id)
    end
end
