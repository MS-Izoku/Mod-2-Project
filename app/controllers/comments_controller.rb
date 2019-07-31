class CommentsController < ApplicationController
       
    def new
        @comment = Comment.new 
    end

    def create

        redirect_to progress_update_path(@comment.progress_update)
    end

    def update
        @comment = Comment.find_by(id:params[:id])
        if @comment.update(comment_params)
            #redirect_to somewhere
        else 
            render "edit"
        end 
    end

    def destroy
        comment = Comment.find_by(id: params[:id])
        update = comment.progress_update
        comment.delete
        redirect_to progress_update_path(update)
    end


    private
    def comment_params
        params.require(:comment).permit(:progress_update_id , :user_id , :content)
    end
end
